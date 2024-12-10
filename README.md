# My Dotfiles

This repository contains my personal dotfiles configuration for a consistent development environment across different machines.

## Configurations

### Tmux Configuration
- Location: `.tmux.conf`
- Custom key bindings and settings for enhanced terminal multiplexing
- Optimized for productivity and ease of use

### Neovim Configuration
- Location: `dot-neovim/` (submodule)
- Complete Neovim setup with custom plugins and keymaps
- For detailed information about the Neovim configuration, see the [dot-neovim](./dot-neovim) directory

## Installation

1. Clone this repository:
   ```bash
   git clone --recursive https://github.com/Simayon/my-dotfiles.git
   ```

2. Set up symlinks:
   ```bash
   ln -s ~/my-dotfiles/.tmux.conf ~/.tmux.conf
   ```

3. For Neovim configuration, follow the setup instructions in the dot-neovim directory.

## Updating

To update all configurations including submodules:
```bash
git pull
git submodule update --init --recursive
```

## License

This project is open-sourced under the MIT License.
