# ⚙️ Configuration Files

<div align="center">

[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](./git)
[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?style=for-the-badge&logo=neovim&logoColor=white)](./nvim)
[![TMUX](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)](./tmux)

> Carefully curated configurations for a seamless development experience

</div>

## 📦 Available Configurations

<details open>
<summary><b>🔧 Core Tools</b></summary>

### [🌿 Git](./git)

Configuration for version control system:
- Enhanced diffs with delta
- Custom commit templates
- Useful aliases and hooks
- Pre-configured git attributes

**Key files:**
```
git/
├── config           # Core git settings
├── gitmessage      # Commit templates
├── gitignore       # Global ignores
└── git-templates/  # Hooks and templates
```

### [⚡ Neovim](./nvim)

Modern text editor setup:
- Full LSP integration
- Custom plugins and themes
- Efficient keybindings
- Smart autocompletion

**Key files:**
```
nvim/
├── init.lua        # Entry point
├── lua/           # Core configs
└── plugins/       # Plugin settings
```

### [🖥️ Tmux](./tmux)

Terminal multiplexer configuration:
- Intuitive key bindings
- Custom status line
- Session management
- Split pane workflow

**Key files:**
```
tmux/
├── tmux.conf      # Main config
└── scripts/       # Helper scripts
```

</details>

## 🔄 Syncing

Each configuration can be individually synced:

```bash
# Sync all configs
make sync-configs

# Sync individual tools
make sync-git
make sync-nvim
make sync-tmux
```

## 📝 Notes

- All paths are relative to your home directory
- Backups are created before any changes
- Each tool has its own README with detailed setup

## 🤝 Contributing

Feel free to suggest improvements or report issues for any configuration. See the main [Contributing Guide](../CONTRIBUTING.md) for details.

---

<div align="center">

For more information about each tool, click the badges above or visit their respective directories.

</div>
