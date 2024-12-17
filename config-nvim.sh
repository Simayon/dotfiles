#!/usr/bin/env bash

# Neovim Setup Script
# Links Neovim configuration from dot-neovim submodule

# Exit immediately if a command exits with a non-zero status
set -euo pipefail

# Logging function
log() {
    echo "[*] $1"
}

# Error handling function
error() {
    echo "[ERROR] $1" >&2
    exit 1
}

# Check for required dependencies
check_dependencies() {
    for cmd in git nvim; do
        if ! command -v "$cmd" &> /dev/null; then
            error "$cmd is not installed. Please install it first."
        fi
    done
}

# Initialize and update submodule
update_submodule() {
    log "Updating dot-neovim submodule..."
    git submodule update --init --recursive dot-neovim
}

# Setup Neovim configuration
setup_neovim_config() {
    log "Setting up Neovim configuration..."
    
    # Create Neovim config directory if it doesn't exist
    mkdir -p "${HOME}/.config/nvim"
    
    # Remove existing configuration if it exists
    if [ -d "${HOME}/.config/nvim" ]; then
        rm -rf "${HOME}/.config/nvim"
    fi
    
    # Create symbolic link to the entire dot-neovim directory
    ln -sf "${PWD}/dot-neovim" "${HOME}/.config/nvim"
    
    log "Neovim configuration linked successfully"
}

# Main execution
main() {
    log "Starting Neovim setup..."
    check_dependencies
    update_submodule
    setup_neovim_config
    log "Neovim setup completed successfully!"
}

# Run the main function
main
