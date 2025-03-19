#!/bin/bash

# Create the lazygit config directory if it doesn't exist
mkdir -p ~/.config/lazygit

# Create symlinks for lazygit configuration
ln -sf $(pwd)/configs/lazygit/config.yml ~/.config/lazygit/config.yml

# Make git-pretty-graph executable and add it to the path
chmod +x $(pwd)/configs/lazygit/git-pretty-graph
if [ -d "$HOME/.local/bin" ]; then
  ln -sf $(pwd)/configs/lazygit/git-pretty-graph ~/.local/bin/git-pretty-graph
else
  echo "Warning: ~/.local/bin directory not found. Please create it and add it to your PATH to use git-pretty-graph."
fi

echo "Lazygit configuration complete!"
