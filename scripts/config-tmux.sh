#!/usr/bin/env bash

# Tmux Setup Script
# Links Tmux configuration from configs/tmux directory

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
    if ! command -v tmux &> /dev/null; then
        error "tmux is not installed. Please install it first."
    fi
}

# Setup Tmux configuration
setup_tmux_config() {
    log "Setting up Tmux configuration..."
    
    # Link tmux configuration
    ln -sf "${PWD}/configs/tmux/.tmux.conf" "${HOME}/.tmux.conf"
    
    log "Tmux configuration linked successfully"
}

# Main function
main() {
    check_dependencies
    setup_tmux_config
}

# Run the main function
main
