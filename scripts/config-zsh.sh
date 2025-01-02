#!/bin/bash

echo "Setting up Zsh configuration..."

# Create Zsh config directory if it doesn't exist
mkdir -p ~/.config

# Create symbolic link for Zsh config
ln -sf $(pwd)/configs/shells/zsh/zshrc ~/.config/.zshrc

source ~/.config/.zshrc

echo "Zsh configuration complete!"
