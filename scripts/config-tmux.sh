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

    log "Installing TPM Plugin Manager"
    if ! git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >/dev/null 2>&1; then
        error "TPM already exists or clone failed"
    fi

    ln -sf "${PWD}/configs/tmux/.tmux.conf" "${HOME}/.tmux.conf"
    
    log "Setting up plugins"

    if [ -f ~/.bash_aliases ]; then
       target_file=~/.bash_aliases
    else
       target_file=~/.bashrc
    fi

    if ! grep -q 'alias tmux=' "$target_file"; then
        echo 'alias tmux="tmux -u"' >> "$target_file"
        log "Added tmux alias to $target_file"
    fi

   echo "alias tmux="tmux -u"" >> ~/.bashrc
    
    log "Tmux configuration linked successfully"
}

# Main function
main() {
    check_dependencies
    setup_tmux_config
}

# Run the main function
main
