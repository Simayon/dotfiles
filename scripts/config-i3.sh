#!/bin/bash

echo "Setting up i3 configuration..."

# Create i3 config directory if it doesn't exist
mkdir -p ~/.config/i3

# Create symbolic link for i3 config
ln -sf $(pwd)/configs/i3/config ~/.config/i3/config

echo "i3 configuration complete!"
