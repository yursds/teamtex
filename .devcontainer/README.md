# TeamTex Base Image (ghcr.io/yursds/teamtex-base:latest)

This directory defines the environment used by the Dev Container.

We are pulling a pre-built image from the GitHub Container Registry (`ghcr.io`) instead of building it from scratch via a local `Dockerfile`. This significantly speeds up the initialization time of Codespaces and local Dev Containers since `texlive-full` does not need to be downloaded and configured from scratch.

## What's Inside the Image?

The `teamtex-base` image is built upon **Ubuntu 24.04** and includes the following pre-configured software and libraries:

1. **Base OS:** `ubuntu:24.04` (Non-interactive Debian frontend)
2. **System Utilities:**
   - `wget`, `git`, `make`, `perl`, `sudo`
3. **LaTeX Distribution:**
   - **`texlive-full`** (Includes all standard TeX Live fonts, packages, and binaries like `latexmk` and `biber`)
4. **User Configurations:**
   - A non-root user named `vscode` (UID 1000) with `sudo` privileges.
   - The default working directory inside the container is set to `/workspace`.

\__(Note: In previous versions this image was built locally using a `Dockerfile`, but it has been offloaded to a pre-built GHCR image for performance. Below you can inspect the exact code used to generate it)._

## Transparent Image Source (Dockerfile)

Below is the identical `Dockerfile` used to build the image hosted on GHCR. We keep this documented here so you know exactly what is running inside your Codespace or local machine:

```dockerfile
# Default to full teXLive, but can be overridden with build args
ARG TEXLIVE_VERSION=full
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install common utilities
RUN apt-get update && apt-get install -y \
    wget \
    git \
    make \
    perl \
    && rm -rf /var/lib/apt/lists/*

# Install specific version of texlive
RUN if [ "$TEXLIVE_VERSION" = "full" ]; then \
    apt-get update && apt-get install -y texlive-full && rm -rf /var/lib/apt/lists/*; \
    else \
    apt-get update && apt-get install -y texlive-latex-recommended texlive-latex-extra biber latexmk && rm -rf /var/lib/apt/lists/*; \
    fi

# Create a non-root user (good practice for devcontainers)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if getent passwd ubuntu > /dev/null 2>&1; then \
    usermod -l $USERNAME -m -d /home/$USERNAME ubuntu && groupmod -n $USERNAME ubuntu; \
    else \
    groupadd --gid $USER_GID $USERNAME && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME; \
    fi \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

USER $USERNAME

# Set the working directory to match the devcontainer/docker-compose workspace mount
WORKDIR /workspace
```
