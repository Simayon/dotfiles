#!/bin/bash

echo "Syncing Neovim configuration..."

# Backup existing configuration
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup
fi

# Create config directory if it doesn't exist
mkdir -p ~/.config

# Symlink new configuration
ln -sf $(pwd)/configs/nvim ~/.config/nvim

echo "Neovim configuration synced successfully!"
