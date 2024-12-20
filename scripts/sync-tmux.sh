#!/bin/bash

echo "Syncing Tmux configuration..."

# Backup existing configuration
if [ -f ~/.tmux.conf ]; then
    cp ~/.tmux.conf ~/.tmux.conf.backup
fi

# Copy new configuration
cp ./configs/tmux/tmux.conf ~/.tmux.conf

# Copy tmux scripts if they exist
if [ -d ./configs/tmux/scripts ]; then
    mkdir -p ~/.tmux/scripts
    cp -r ./configs/tmux/scripts/* ~/.tmux/scripts/
fi

echo "Tmux configuration synced successfully!"
