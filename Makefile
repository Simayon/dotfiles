.PHONY: all git-setup nvim-setup tmux-setup clean help test doctor update sync-configs sync-git sync-nvim sync-tmux

all: git-setup nvim-setup tmux-setup

git-setup:
	@echo "Setting up Git configuration..."
	@chmod +x ./scripts/config-git.sh
	@./scripts/config-git.sh

nvim-setup:
	@echo "Setting up Neovim configuration..."
	@chmod +x ./scripts/config-nvim.sh
	@./scripts/config-nvim.sh

tmux-setup:
	@echo "Setting up Tmux configuration..."
	@chmod +x ./scripts/config-tmux.sh
	@./scripts/config-tmux.sh

clean:
	@echo "Cleaning up dotfiles symlinks..."
	@rm -f ~/.gitconfig
	@rm -f ~/.config/nvim
	@rm -f ~/.tmux.conf

test:
	@echo "Running tests..."
	@chmod +x ./scripts/test.sh
	@./scripts/test.sh

doctor:
	@echo "Checking system health..."
	@chmod +x ./scripts/doctor.sh
	@./scripts/doctor.sh

update:
	@echo "Updating all configurations..."
	@git pull
	@git submodule update --init --recursive

sync-configs: sync-git sync-nvim sync-tmux
	@echo "All configurations synced!"

sync-git:
	@echo "Syncing Git configuration..."
	@chmod +x ./scripts/sync-git.sh
	@./scripts/sync-git.sh

sync-nvim:
	@echo "Syncing Neovim configuration..."
	@chmod +x ./scripts/sync-nvim.sh
	@./scripts/sync-nvim.sh

sync-tmux:
	@echo "Syncing Tmux configuration..."
	@chmod +x ./scripts/sync-tmux.sh
	@./scripts/sync-tmux.sh

help:
	@echo "Dotfiles Setup Targets:"
	@echo "  all          : Setup complete system (git, neovim, tmux)"
	@echo "  git-setup    : Setup git configuration"
	@echo "  nvim-setup   : Install and configure Neovim"
	@echo "  tmux-setup   : Install and configure Tmux"
	@echo "  clean        : Remove dotfile symlinks"
	@echo "  test         : Run test suite"
	@echo "  doctor       : Check system health"
	@echo "  update       : Update all configurations"
	@echo "  sync-configs : Sync all configurations"
	@echo "  sync-git     : Sync git configuration"
	@echo "  sync-nvim    : Sync neovim configuration"
	@echo "  sync-tmux    : Sync tmux configuration"
	@echo "  help         : Show this help message"
