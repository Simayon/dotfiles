.PHONY: all git-setup nvim-setup tmux-setup clean help

all: git-setup nvim-setup tmux-setup

git-setup:
	@echo "Setting up Git configuration..."
	@chmod +x ./config-git.sh
	@./config-git.sh

nvim-setup:
	@echo "Setting up Neovim configuration..."
	@chmod +x ./config-nvim.sh
	@./config-nvim.sh

tmux-setup:
	@echo "Setting up Tmux configuration..."
	@chmod +x ./config-tmux.sh
	@./config-tmux.sh

clean:
	@echo "Cleaning up dotfiles symlinks..."
	@rm -f ~/.gitconfig
	@rm -f ~/.config/nvim/init.lua
	@rm -f ~/.tmux.conf

help:
	@echo "Dotfiles Setup Targets:"
	@echo "  all        : Setup complete system (git, neovim, tmux)"
	@echo "  git-setup  : Setup git configuration with delta"
	@echo "  nvim-setup : Install and configure Neovim"
	@echo "  tmux-setup : Install and configure Tmux"
	@echo "  clean      : Remove dotfile symlinks"
	@echo "  help       : Show this help message"
