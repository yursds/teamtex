# TeamTex (TMT)

TeamTex is a lightweight and customizable LaTeX environment built for Dev Containers, GitHub Codespaces, and robust local usage.

## TL;DR (Quick Start)

1. **Click "Use this template"** on GitHub to create your own repository.
2. **Open the Environment (Codespace):**
   - **2a. From VS Code:** Install the _GitHub Codespaces_ extension, press `Ctrl+Shift+P`, search for **Create New Codespace** and select your new repository.
   - **2b. From Browser:** Open your repository on GitHub and click `Code` > `Codespaces` > `Create codespace on main`.
3. **Wait** for the prebuilt environment to load.
4. Open `main.tex` and start typing. Every **save (Ctrl + S)** compiles automatically!
5. Find your PDF in the `build/` folder.

---

## Table of Contents

1. [Compiling the Project](#compiling-the-project)
2. [Exporting (ZIP & PDF)](#exporting-zip--pdf)
3. [Detailed Guides](#detailed-guides)
   - [Work Environments](docs/environments.md)
   - [Git Workflow & Best Practices](docs/git-workflow.md)
   - [Advanced Usage & Customization](docs/advanced-usage.md)

---

## Compiling the Project

The project is specifically configured to keep the root directory clean by routing all files into the `build/` directory.

### Option A: VS Code (Recommended)

1. Open `main.tex`.
2. Saving (Ctrl + S) triggers automatic compilation.
3. Use the TeX sidebar icon for manual builds or to view the PDF.

### Option B: Terminal

If you prefer the command line, use `latexmk` directly:

```bash
# Compile
latexmk -pdf -outdir=build main.tex

# Clean
latexmk -c -outdir=build main.tex && rm -rf build/
```

---

## Exporting (ZIP & PDF)

### Download PDF

1. Go to the `build/` folder in the sidebar.
2. Right-click `main.pdf` > **Download**.

### Download Source (ZIP)

To get a clean archive of your source code:

1. Run `./export_source.sh` in the terminal.
2. Right-click the generated `teamtex_source.zip` > **Download**.

---

## Detailed Guides

| Guide                                         | Description                                                 |
| :-------------------------------------------- | :---------------------------------------------------------- |
| [**Work Environments**](docs/environments.md) | How to setup Codespaces, Local Docker, or Native LaTeX.     |
| [**Git Workflow**](docs/git-workflow.md)      | Divergent branches, Codespace persistence, and branching.   |
| [**Advanced Usage**](docs/advanced-usage.md)  | Templates, Copilot, Troubleshooting, and custom extensions. |

> [!TIP]
> **Don't stop at the Quick Start!** We highly recommend reading through all the detailed guides above to fully master the TeamTex environment and its collaborative features.

---
