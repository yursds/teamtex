# Work Environments

TeamTex is designed to be flexible. Choose the environment that best suits your needs:

## Using GitHub Codespaces

The fastest environment, requires zero local configuration.

**Directly from VS Code (Desktop):**

1. Install the **GitHub Codespaces** extension in VS Code.
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac).
3. Select **Codespaces: Create New Codespace** and choose the `TeamTex` repository.

**From the Browser:**

1. Open this repository on GitHub.
2. Click on **Code** > **Codespaces** > **Create codespace on main**.
3. Wait for the build to finish (installs `texlive-full` by default).

---

## Using Local Dev Containers

Work locally while maintaining an isolated environment identical to the server.

**Method 1: Auto-build (GUI)**

1. Install [Docker](https://www.docker.com/) and [Visual Studio Code](https://code.visualstudio.com/).
2. Install the **Dev Containers** extension in VS Code.
3. Open the project folder in VS Code. A popup will appear in the bottom right corner: click **Reopen in Container**.
   - Pro Tip: For a lighter image, change `TEXLIVE_VERSION=full` to `TEXLIVE_VERSION=light` in the `.devcontainer/docker-compose.yml` file before building.

**Method 2: Manual CLI Build and VS Code Attach**

1. Open a terminal and navigate to the `.devcontainer/` folder.
2. Run `docker compose up -d --build` to start the LaTeX container in the background.
3. Open VS Code, press `Ctrl+Shift+P`, search for **Dev Containers: Attach to Running Container...** and select the `teamtex` container.

---

## Using Local Native Setup (Without Docker)

If you prefer to work locally without Docker.

1. Open the project in VS Code or your preferred editor.
2. Make sure you have a local LaTeX distribution installed (e.g., TeX Live or MiKTeX).
3. Thanks to the integrated `.vscode/settings.json`, LaTeX Workshop will automatically create a `build/` folder to contain all auxiliary files.

---

## Workspace Directory Handling

Whether you are using GitHub Codespaces or Local Dev Containers, your entire repository is automatically mapped inside the container to the `/workspace` directory.

Any files, scripts, images, or custom sub-folders (e.g., `src/`, `chapters/`, `assets/`) you add to your project folder alongside `main.tex` are instantly loaded, fully accessible by LaTeX during compilation, and synced with your local machine/GitHub. You do not need to modify the `Dockerfile` to add new files.
