# TeamTex (TMT)

TeamTex is a lightweight and customizable LaTeX environment built for Dev Containers, GitHub Codespaces, and robust local usage.

## TL;DR (Quick Start)

1. **Click "Use this template"** on GitHub to create your new personal repository.
2. **Open the Environment (Codespace):**
   - **2a. From VS Code:** Install the _GitHub Codespaces_ extension, press `Ctrl+Shift+P`, search for **Create New Codespace** and select your new repository.
   - **2b. From Browser:** Open your new repository on GitHub and click `Code` > `Codespaces` > `Create codespace on main`.
3. **Wait a few seconds** for the prebuilt environment to load.
4. Open `main.tex` and start typing. Every time you **save (`Ctrl + S`)**, it compiles automatically!
5. Find your generated PDF in the `build/` folder.

---

## Table of Contents

1. [Work Environments](#1-work-environments)
   - [Using GitHub Codespaces](#using-github-codespaces)
   - [Using Local Dev Containers](#using-local-dev-containers)
   - [Using Local Native Setup](#using-local-native-setup)
2. [Compiling the Project](#2-compiling-the-project)
   - [Defining the Main Source File](#defining-the-main-source-file)
   - [Option A: LaTeX Workshop (VS Code)](#option-a-latex-workshop-vs-code)
   - [Option B: Terminal Makefile](#option-b-terminal-makefile)
3. [Exporting](#3-exporting)

- [Download PDF](#download-pdf)
- [Download Source (ZIP)](#download-source-zip)

4. [Using as a GitHub Template](#4-using-as-a-github-template)

5. [Extra Features](#5-extra-features)

---

## 1. Work Environments

### Using GitHub Codespaces

The fastest environment, requires zero local configuration.

**Directly from VS Code (Desktop):**

1. Install the **GitHub Codespaces** extension in VS Code.
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac).
3. Select **Codespaces: Create New Codespace** and choose the `TeamTex` repository.

**From the Browser:**

1. Open this repository on GitHub.
2. Click on **Code** > **Codespaces** > **Create codespace on main**.
3. Wait for the build to finish (installs `texlive-full` by default).

### Using Local Dev Containers

Work locally while maintaining an isolated environment identical to the server. There are two ways to do this:

**Method 1: Auto-build (GUI)**

1. Install [Docker](https://www.docker.com/) and [Visual Studio Code](https://code.visualstudio.com/).
2. Install the **Dev Containers** extension in VS Code.
3. Open the project folder in VS Code. A popup will appear in the bottom right corner: click **Reopen in Container**.
   - _Pro Tip:_ For a lighter image, change `TEXLIVE_VERSION=full` to `TEXLIVE_VERSION=light` in the `.devcontainer/docker-compose.yml` file before building.

**Method 2: Manual CLI Build and VS Code Attach**

1. Open a terminal and navigate to the `.devcontainer/` folder.
2. Run `docker compose up -d --build` to start the LaTeX container in the background.
3. Open VS Code, press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac), search for **Dev Containers: Attach to Running Container...** and select the `teamtex` container.

### Using Local Native Setup (Recommended Only for Experts)

If you prefer to work locally without Docker.

1. Open the project in VS Code or your preferred editor.
2. Make sure you have a local LaTeX distribution installed (e.g., TeX Live or MiKTeX).
3. Thanks to the integrated `.vscode/settings.json`, LaTeX Workshop will automatically create a `build/` folder to contain all auxiliary files.

### Workspace Directory Handling

Whether you are using GitHub Codespaces or Local Dev Containers, your entire repository is automatically mapped inside the container to the `/workspace` directory.

> **What does this mean?** Any files, scripts, images, or custom sub-folders (e.g., `src/`, `chapters/`, `assets/`) you add to your project folder alongside `main.tex` are instantly loaded, fully accessible by LaTeX during compilation, and synced with your local machine/GitHub. You do **not** need to modify the `Dockerfile` to add new files.

---

## 2. Compiling the Project

The project is specifically configured to keep the root directory clean by routing PDFs and logs into the `build/` directory.

### Defining the Main Source File

By default, the compilation starts from `main.tex`. If you want to use a different file name (e.g., `thesis.tex`) or compile sub-files located in other folders:

- **For LaTeX Workshop:** Add `% !TEX root = ../thesis.tex` (adjust the path accordingly) at the very top of your sub-files. The extension will automatically track the root file.
- **For the Makefile:** Open the `Makefile` and change `main.tex` to your new filename.

### Option A: LaTeX Workshop (VS Code)

Inside a Codespace, a Dev Container, or in local VS Code:

1. Open the `main.tex` file.
2. Every time you save the file (`Ctrl + S`), the compilation starts automatically.
3. If you want to compile manually, open the LaTeX sidebar by clicking the **TeX** icon on the left and select **Build LaTeX project**.

### Option B: Terminal Makefile

If you aren't using VS Code or prefer command-line compilation:

```bash
make all   # Compiles main.tex and outputs to build/
make clean # Removes the entire build/ directory
```

---

## 3. Exporting

If you are used to Overleaf's feature of downloading the compiled PDF or a ZIP archive of the source code, you can easily do the same in Codespaces or VS Code.

### Download PDF

1. Navigate to the `build/` directory in the File Explorer (left sidebar).
2. Right-click on your compiled PDF (`main.pdf`).
3. Select **Download**.

### Download Source (ZIP)

To download your entire LaTeX source code as a ZIP archive:

1. In the VS Code File Explorer, right-click on the `teamtex` workspace folder (or right-click in an empty space in the explorer).
2. Assuming you are in the Codespace, look for the **Download...** option.
3. Alternatively, you can use the built-in Terminal to zip the source:

   ```bash
   zip -r teamtex_source.zip . -x "build/*" -x ".git/*" -x ".vscode/*" -x ".devcontainer/*" -x ".gitignore" -x "Makefile" -x "README.md" -x ".latexmkrc" -x ".github/*"
   ```

   > **Note for Windows users:** The `zip` command requires a Linux-like terminal (like the one present in the Dev Container, Codespaces, or Git Bash). If you are using native PowerShell, you might need to manually zip the files using the File Explorer.

   Then right-click the generated `teamtex_source.zip` file and select **Download**.

---

## 4. Using as a GitHub Template

Instead of cloning or forking, you can use TeamTex as a blueprint to mint completely clean, new repositories.

1. Navigate to the main page of the TeamTex repository on GitHub.
2. Click the green **Use this template** button near the top right (above the file list).
3. Select **Create a new repository**.
4. Choose an owner and enter a repository name for your new project.
5. **Privacy:** You can freely select **Public** or **Private**. Codespaces and Dev Containers work perfectly fine in private repositories without any extra configuration.
6. Click **Create repository from template**.

This will generate a brand new repository populated with the TeamTex structure, but without the git commit history of the original template.

---

## 5. Extra Features

- **Live Collaboration:** `vsliveshare` extension is pre-configured for multi-author writing.
- **GitHub Copilot:** Supported out-of-the-box.
- **Grammar Options:** You can enable LTeX by editing `.devcontainer/devcontainer.json` and uncommenting `valentjn.vscode-ltex` (default language is `en-US`).
