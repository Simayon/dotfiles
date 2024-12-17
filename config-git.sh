#!/usr/bin/env bash

# Git Configuration Setup Script
# Sets up Git configuration with delta and personal/work separation

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
    for cmd in cargo git; do
        if ! command -v "$cmd" &> /dev/null; then
            error "$cmd is not installed. Please install it first."
        fi
    done
}

# Install git-delta
install_git_delta() {
    if ! command -v delta &> /dev/null; then
        log "Installing git-delta..."
        if cargo install git-delta; then
            log "git-delta installed successfully"
        else
            error "Failed to install git-delta"
        fi
    else
        log "git-delta is already installed"
    fi
}

# Setup Git configuration
setup_git_config() {
    log "Setting up Git configuration..."
    
    # Create symbolic link for main gitconfig
    ln -sf "${PWD}/.gitconfig" "${HOME}/.gitconfig"
    
    # Create work-specific gitconfig if it doesn't exist
    if [ ! -f "${HOME}/.gitconfig-work" ]; then
        cat > "${HOME}/.gitconfig-work" << 'EOL'
# Work-specific Git configuration
[user]
    # Configure your work email and name here
    # name = Your Name
    # email = your.name@company.com

# Add any work-specific Git settings below
EOL
        log "Created template .gitconfig-work. Please update it with your work details."
    else
        log "Work Git config already exists at ~/.gitconfig-work"
    fi
    
    log "Git configuration linked successfully"
}

# Main execution
main() {
    log "Starting Git setup..."
    check_dependencies
    install_git_delta
    setup_git_config
    log "Git setup completed successfully!"
    log "NOTE: Remember to update ~/.gitconfig-work with your work credentials"
}

# Run the main function
main
