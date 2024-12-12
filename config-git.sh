#!/bin/bash

# Git Delta Installation and Configuration Script

# Ensure the script fails if any command fails
set -e

# Install git-delta using cargo
echo "Installing git-delta..."
cargo install git-delta

# Configure git with delta settings
echo "Configuring git with delta settings..."
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3

echo "Git delta installation and configuration completed successfully!"
