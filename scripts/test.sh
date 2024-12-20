#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Running test suite..."

# Test Git configuration
if [ -f ~/.gitconfig ]; then
    echo -e "${GREEN}✓${NC} Git configuration exists"
else
    echo -e "${RED}✗${NC} Git configuration missing"
fi

# Test Neovim configuration
if [ -d ~/.config/nvim ]; then
    echo -e "${GREEN}✓${NC} Neovim configuration exists"
else
    echo -e "${RED}✗${NC} Neovim configuration missing"
fi

# Test Tmux configuration
if [ -f ~/.tmux.conf ]; then
    echo -e "${GREEN}✓${NC} Tmux configuration exists"
else
    echo -e "${RED}✗${NC} Tmux configuration missing"
fi

# Test if all required scripts are executable
for script in config-git.sh config-nvim.sh config-tmux.sh sync-git.sh sync-nvim.sh sync-tmux.sh; do
    if [ -x "$(dirname "$0")/$script" ]; then
        echo -e "${GREEN}✓${NC} $script is executable"
    else
        echo -e "${RED}✗${NC} $script is not executable"
    fi
done

echo "Test suite completed!"
