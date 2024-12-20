#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_command() {
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        if [ ! -z "$2" ]; then
            version=$($2)
            echo -e "  Version: $version"
        fi
        return 0
    else
        echo -e "${RED}✗${NC} $1 is not installed"
        return 1
    fi
}

echo "Checking system health..."

# Check core dependencies
echo -e "\nCore Dependencies:"
check_command "git" "git --version"
check_command "nvim" "nvim --version | head -n1"
check_command "tmux" "tmux -V"
check_command "make" "make --version | head -n1"
check_command "npm" "npm --version"

# Check optional tools
echo -e "\nOptional Tools:"
check_command "delta" "delta --version"
check_command "cmatrix" "cmatrix -V"
check_command "markdownlint" "markdownlint --version"
check_command "rg" "rg --version | head -n1"

# Check configuration files
echo -e "\nConfiguration Files:"
if [ -f ~/.gitconfig ]; then
    echo -e "${GREEN}✓${NC} Git configuration exists"
else
    echo -e "${YELLOW}!${NC} Git configuration missing"
fi

if [ -d ~/.config/nvim ]; then
    echo -e "${GREEN}✓${NC} Neovim configuration exists"
else
    echo -e "${YELLOW}!${NC} Neovim configuration missing"
fi

if [ -f ~/.tmux.conf ]; then
    echo -e "${GREEN}✓${NC} Tmux configuration exists"
else
    echo -e "${YELLOW}!${NC} Tmux configuration missing"
fi

echo -e "\nHealth check completed!"
