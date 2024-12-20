#!/bin/bash

echo "Syncing Git configuration..."

# Backup existing configuration
if [ -f ~/.gitconfig ]; then
    cp ~/.gitconfig ~/.gitconfig.backup
fi

# Copy new configuration
cp ./configs/git/config ~/.gitconfig

# Copy git message template
if [ -f ./configs/git/gitmessage ]; then
    cp ./configs/git/gitmessage ~/.gitmessage
fi

# Copy git templates
if [ -d ./configs/git/git-templates ]; then
    cp -r ./configs/git/git-templates ~/.git-templates
fi

echo "Git configuration synced successfully!"
