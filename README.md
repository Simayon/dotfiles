# 🏠 Dotfiles

<div align="center">

![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Tmux](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)
![i3](https://img.shields.io/badge/i3-222222?style=for-the-badge&logo=i3&logoColor=white)
![Starship](https://img.shields.io/badge/starship-DD0B78?style=for-the-badge&logo=starship&logoColor=white)
![Ghostty](https://img.shields.io/badge/ghostty-4D4D4D?style=for-the-badge&logo=terminal&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

<img src="https://github.com/Simayon/my-dotfiles/blob/master/static/working-person.gif" alt="Working Man" width="600" >

> A meticulously crafted development environment that feels like home 🏡

</div>

## ✨ Features

<details open>
<summary><b>🎯 Highlights</b></summary>

- 🚀 **One-Command Setup**
  - Automated installation with `make all`
  - Individual component setup options
  - Clean and modular structure

- ⚡ **Powerful Tools**
  - Advanced Neovim configuration with LSP and plugins
  - Tmux setup for enhanced terminal workflow
  - Git configuration with delta integration
  - i3 window manager for efficient workspace management
  - Starship prompt for beautiful and informative shell
  - Ghostty terminal with Catppuccin theme integration

- 🔄 **Version Controlled**
  - Git submodules for external dependencies
  - Easy updates and synchronization
  - Backup and restore functionality

- 🛠️ **Customizable**
  - Modular configuration files
  - Easy to extend and modify
  - Well-documented settings

</details>

## 📁 Directory Structure

<details>
<summary><b>View Structure</b></summary>

```
.
├── 📁 configs/           Configuration files
│   ├── 🔧 git/          Git configuration
│   │   ├── config       Core git settings
│   │   └── template     Commit templates
│   ├── 📝 nvim/         Neovim configuration
│   │   ├── init.lua     Entry point
│   │   └── lua/         Modular configs
│   ├── 🖥️  tmux/         Tmux configuration
│   │   ├── tmux.conf    Main config
│   │   └── scripts/     Helper scripts
│   ├── 🪟 i3/           i3 window manager
│   │   └── config       i3 configuration
│   └── 🚀 starship/     Starship prompt
│       └── starship.toml Configuration
├── 🛠️ scripts/          Setup scripts
├── 📋 Makefile          Installation automation
└── 📘 README.md         Documentation
```

</details>

## ⚡ Quick Start

### Prerequisites

<details>
<summary><b>View Dependencies</b></summary>

**Core Requirements:**
- git >= 2.30.0
- neovim >= 0.9.0
- tmux >= 3.2
- i3 >= 4.20
- starship >= 1.14.0
- make
- npm >= 7.0.0

**Optional Tools:**
- delta (for git diffs)
- cmatrix (for animations)
- markdownlint-cli (for markdown)

**Required for Neovim:**
- fzf (required for file searching)
- ripgrep (required for file searching)
- fd-find (required for file navigation)

</details>

### 🚀 Installation

<details>
<summary><b>Step-by-Step Guide</b></summary>

1. **Clone the Repository**
   ```bash
   git clone --recursive https://github.com/Simayon/dotfiles.git
   cd dotfiles
   ```

2. **Install Everything**
   ```bash
   make all
   ```

   Or choose specific components:
   ```bash
   make git-setup    # Git configuration
   make nvim-setup   # Neovim setup
   make tmux-setup   # Tmux configuration
   make i3-setup     # i3 window manager
   make starship-setup # Starship prompt
   ```

3. **Verify Installation**
   ```bash
   make test        # Run tests
   make doctor      # Check health
   ```

</details>

### 🔄 Updates

<details>
<summary><b>Keeping Current</b></summary>

```bash
# Update everything
make update

# Update specific components
make update-nvim
make update-tmux
make update-i3
make update-starship
```

</details>

## 📦 Components

<details>
<summary><b>Available Configurations</b></summary>

### 🔧 Git Configuration
- Delta integration for better diffs
- Custom commit templates
- Useful aliases and hooks
- [Learn more](./configs/git/README.md)

### 📝 Neovim Setup
- Modern IDE features
- Custom plugins and themes
- LSP integration
- [Learn more](./configs/nvim/README.md)

### 🖥️ Tmux Configuration
- Intuitive key bindings
- Status line customization
- Session management
- [Learn more](./configs/tmux/README.md)

### 🪟 i3 Window Manager
- Efficient workspace management
- Custom key bindings
- [Learn more](./configs/i3/README.md)

### 🚀 Starship Prompt
- Beautiful and informative shell
- Customizable configuration
- [Learn more](./configs/starship/README.md)

</details>

## 🤝 Contributing

Contributions are welcome! Feel free to:
- 🐛 Report bugs
- 💡 Suggest features
- 🔀 Submit pull requests

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
<p>Made with ❤️ by <a href="https://simayonthampi.me">Simayon Thampi</a></p>

[![portfolio](https://img.shields.io/badge/Portfolio-255E63?style=for-the-badge&logo=About.me&logoColor=white)](https://simayonthampi.me)
[![linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/simayonthampi)
[![github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/simayon)

</div>
