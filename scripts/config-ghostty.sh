#!/bin/bash

# Create necessary directories
mkdir -p ~/.config/ghostty

# Create symlink for Ghostty configuration
ln -sf $(pwd)/configs/ghostty/config ~/.config/ghostty/config

echo "Ghostty configuration has been set up!"
