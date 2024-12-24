#!/bin/bash

echo "Setting up Starship configuration..."

# Create starship config directory if it doesn't exist
mkdir -p ~/.config

# Create symbolic link for starship config
ln -sf $(pwd)/configs/starship/starship.toml ~/.config/starship.toml

# Add starship init to shell rc files if not already present
for rc in ~/.bashrc ~/.zshrc; do
    if [ -f "$rc" ]; then
        if ! grep -q "eval \"\$(starship init" "$rc"; then
            echo 'eval "$(starship init bash)"' >> "$rc"
        fi
    fi
done

echo "Starship configuration complete!"
