#!/usr/bin/env bash

# Git Setup Script
# Links Git configuration files from configs/git directory

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
    for cmd in git delta; do
        if ! command -v "$cmd" &> /dev/null; then
            error "$cmd is not installed. Please install it first."
        fi
    done
}

# Setup Git configuration
setup_git_config() {
    log "Setting up Git configuration..."
    
    # Link main gitconfig
    ln -sf "${PWD}/configs/git/.gitconfig" "${HOME}/.gitconfig"
    
    # Link personal and work configs
    ln -sf "${PWD}/configs/git/.gitconfig-personal" "${HOME}/.gitconfig-personal"
    ln -sf "${PWD}/configs/git/.gitconfig-work" "${HOME}/.gitconfig-work"
    
    # Link git message template
    ln -sf "${PWD}/configs/git/.gitmessage" "${HOME}/.gitmessage"
    
    # Copy git templates
    if [ -d "${HOME}/.git-templates" ]; then
        rm -rf "${HOME}/.git-templates"
    fi
    cp -r "${PWD}/configs/git/.git-templates" "${HOME}/"
    
    log "Git configuration linked successfully"
    log "Personal git config will be used in ~/Projects/PERSONAL/"
    log "Work git config will be used in ~/Projects/WORK/"
}

# Main function
main() {
    check_dependencies
    setup_git_config
}

# Run the main function
main
