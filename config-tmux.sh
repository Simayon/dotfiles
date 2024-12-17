#!/usr/bin/env bash

# Tmux Setup Script
# Links tmux configuration and sets up TPM

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
    for cmd in git tmux; do
        if ! command -v "$cmd" &> /dev/null; then
            error "$cmd is not installed. Please install it first."
        fi
    done
}

# Install Tmux Plugin Manager (TPM)
install_tpm() {
    local TPM_PATH="${HOME}/.tmux/plugins/tpm"
    if [ ! -d "$TPM_PATH" ]; then
        log "Installing Tmux Plugin Manager..."
        git clone https://github.com/tmux-plugins/tpm "$TPM_PATH"
    else
        log "Tmux Plugin Manager already installed"
    fi
}

# Setup Tmux configuration
setup_tmux_config() {
    log "Setting up Tmux configuration..."
    
    # Create symbolic link for tmux configuration
    ln -sf "${PWD}/.tmux.conf" "${HOME}/.tmux.conf"
    
    # Install plugins if TPM is installed
    if [ -f "${HOME}/.tmux/plugins/tpm/bin/install_plugins" ]; then
        "${HOME}/.tmux/plugins/tpm/bin/install_plugins"
    fi
    
    log "Tmux configuration linked successfully"
}

# Main execution
main() {
    log "Starting Tmux setup..."
    check_dependencies
    install_tpm
    setup_tmux_config
    log "Tmux setup completed successfully!"
    log "NOTE: Press prefix + I (capital i) to install tmux plugins"
}

# Run the main function
main
