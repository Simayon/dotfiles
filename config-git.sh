#!/usr/bin/env bash

# Dotfiles Git Delta Setup Script
# Provides robust installation and configuration for git-delta

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
    log "Installing git-delta..."
    if cargo install git-delta; then
        log "git-delta installed successfully"
    else
        error "Failed to install git-delta"
    fi
}

# Configure git with delta settings
configure_git_delta() {
    log "Configuring git with delta settings..."

    # Array of git config commands
    local configs=(
        "core.pager delta"
        "interactive.diffFilter 'delta --color-only'"
        "delta.navigate true"
        "merge.conflictStyle zdiff3"
    )

    for config in "${configs[@]}"; do
        if git config --global "$config"; then
            log "Configured: $config"
        else
            error "Failed to configure: $config"
        fi
    done
}

# Main execution
main() {
    log "Starting Git Delta setup..."
    check_dependencies
    install_git_delta
    configure_git_delta
    log "Git Delta setup completed successfully!"
}

# Run the main function
main
