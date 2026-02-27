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
