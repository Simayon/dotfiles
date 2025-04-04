#!/bin/bash

set -e

echo "Setting up Zsh and dependencies..."

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt-get update
    sudo apt-get install -y zsh
fi

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh plugins
echo "Installing zsh plugins..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "Installing fzf..."
    sudo apt-get install -y fzf
fi

# Check if batcat is installed
if ! command -v batcat &> /dev/null; then
    echo "Installing bat (batcat)..."
    sudo apt-get install -y bat
fi

# Install Intelli-Shell
echo "Installing Intelli-Shell..."
INTELLI_HOME="$HOME/.local/share/intelli-shell"
mkdir -p "$INTELLI_HOME/bin"

# Only install if not already installed
if [ ! -f "$INTELLI_HOME/bin/intelli-shell" ]; then
    curl -Lsf https://raw.githubusercontent.com/lasantosr/intelli-shell/main/install.sh | bash
fi

# Create Zsh config directory if it doesn't exist
mkdir -p ~/.config

# Create symbolic links for Zsh configs
echo "Creating symbolic links for zsh configuration..."
ln -sf $(pwd)/configs/shells/zsh/zshrc ~/.zshrc

# Create zshenv if it doesn't exist
if [ ! -f "$HOME/.zshenv" ]; then
    cat > "$HOME/.zshenv" << 'EOF'
# Added by dotfiles installation

# Add Cargo bin to PATH if the directory exists
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Added by Radicle (if installed)
if [ -d "$HOME/.radicle/bin" ]; then
    export PATH="$PATH:$HOME/.radicle/bin"
fi
EOF
fi

# Set zsh as default shell if it's not already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
fi

echo "Zsh configuration complete! Please restart your terminal or run 'source ~/.zshrc' to apply changes."
