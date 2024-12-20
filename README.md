# My Dotfiles

This repository contains my personal dotfiles configuration for a consistent development environment across different machines.

## Directory Structure
```
.
├── configs/           # All configuration files
│   ├── git/          # Git configuration
│   ├── nvim/         # Neovim configuration
│   └── tmux/         # Tmux configuration
├── scripts/          # Setup and installation scripts
├── Makefile          # Installation automation
└── README.md         # This file
```

## Configurations

### Git Configuration
- Location: `configs/git/`
- Custom git configuration with delta integration
- Commit message template and hooks

### Tmux Configuration
- Location: `configs/tmux/`
- Custom key bindings and settings for enhanced terminal multiplexing
- Optimized for productivity and ease of use

### Neovim Configuration
- Location: `configs/nvim/` (symlinked from dot-neovim submodule)
- Complete Neovim setup with custom plugins and keymaps
- For detailed information, see the [dot-neovim](./dot-neovim) directory

## Dependencies

This dotfiles repository requires several dependencies:

### Core Dependencies
- git
- neovim
- cmatrix
- npm (for additional tools)

### Additional Tools
- markdownlint-cli (for markdown linting in Neovim)

Install core dependencies on Ubuntu/Debian:
```bash
sudo apt install git neovim cmatrix npm
```

Install additional tools:
```bash
npm install -g markdownlint-cli
```

## Installation

1. Clone this repository:
   ```bash
   git clone --recursive https://github.com/Simayon/dotfiles.git
   cd dotfiles
   ```

2. Install all configurations:
   ```bash
   make all
   ```

   Or install individual components:
   ```bash
   make git-setup    # Only git configuration
   make nvim-setup   # Only neovim configuration
   make tmux-setup   # Only tmux configuration
   ```

3. To remove configurations:
   ```bash
   make clean
   ```

## Updating

To update all configurations including submodules:
```bash
git pull
git submodule update --init --recursive
```

## License

This project is open-sourced under the MIT License.
