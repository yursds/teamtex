# Git Workflow & Best Practices

To ensure a smooth collaborative experience and avoid data loss, please follow these essential Git rules:

## Warning: Divergent Branches

If you work locally and then switch to a Codespace (or vice versa), **always pull before you start working**. If you see an error about "divergent branches", it means the remote repository has changes that your current environment lacks.

- **Always git pull** (or click "Sync") the moment you open the project.
- **Always git push** your commits before closing your session.

## Codespaces Persistence

While Codespaces persist your data, they are essentially remote virtual machines. **If you don't push your commits, your work is not backed up on GitHub.** Always push your changes to ensure they are visible to others and safely stored.

## Local Work & Branching Strategy

> [!IMPORTANT]
> **Use Git exactly as defined!** For the collaborative environment to work correctly, you must follow the branching strategy strictly.

For intensive local work or large structural changes:

1. **Use Branches:** Create a dedicated branch (e.g., `git checkout -b feature/new-section`) to keep your experiments isolated.
2. **Main Branch for Quick Edits:** Keep the `main` branch stable and use it for quick collaborative edits directly in the Codespaces browser.
3. **Merge Often:** Once your local work is stable, merge it back into `main` to keep everything synchronized.

## Managing & Deleting Codespaces

To avoid clutter and manage your GitHub resource limits, it's good practice to delete Codespaces you are no longer using.

1. Go to [github.com/codespaces](https://github.com/codespaces).
2. Here you will see a list of all your active and stopped Codespaces across all repositories.
3. Click on the **three dots (...)** next to a Codespace and select **Delete**.
   - Note: Deleting a Codespace will permanently remove any uncommitted changes. **Always push your work first!**
