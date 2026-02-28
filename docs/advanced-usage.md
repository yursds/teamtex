# Advanced Usage

## Using as a GitHub Template

Instead of cloning or forking, you can use TeamTex as a blueprint to mint completely clean repositories.

1. Navigate to the main page of the TeamTex repository.
2. Click the green **Use this template** button.
3. Select **Create a new repository**.
4. Choose an owner, name, and privacy (Public or Private).
5. Click **Create repository from template**.

---

## Extra Features

- **Live Collaboration:** `vsliveshare` extension is pre-configured.
- **GitHub Copilot:** Supported out-of-the-box.
- **Grammar Options:** Enable LTeX by editing `.devcontainer/devcontainer.json` and uncommenting `valentjn.vscode-ltex`.

---

## Troubleshooting & Customization

### Changing the Main File Name

If you rename your main file (e.g., `thesis.tex`):

1. **Automation:** Update `.devcontainer/devcontainer.json` (change `main.tex` in `updateContentCommand`).
2. **VS Code:** If needed, update `.vscode/settings.json`.
3. **Manual:** Run `latexmk -pdf -outdir=build thesis.tex`.

### Missing Folders (.vscode, .devcontainer, .github, docs)

To provide a clean experience, we hide configuration folders.

- **Why?** Focus on writing, prevent accidental setting changes.
- **How to show them:** Change `"files.exclude"` values to `false` in settings.

### Adding VS Code Extensions

1. Open `.devcontainer/devcontainer.json`.
2. Add the ID to the `"extensions"` array.
3. Rebuild the container.
