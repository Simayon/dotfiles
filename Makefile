.PHONY: all git-setup nvim-setup tmux-setup i3-setup starship-setup clean help test doctor update sync-configs sync-git sync-nvim sync-tmux sync-i3 sync-starship

all: git-setup nvim-setup tmux-setup i3-setup starship-setup

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

i3-setup:
	@echo "Setting up i3 configuration..."
	@chmod +x ./scripts/config-i3.sh
	@./scripts/config-i3.sh

starship-setup:
	@echo "Setting up Starship configuration..."
	@chmod +x ./scripts/config-starship.sh
	@./scripts/config-starship.sh

clean:
	@echo "Cleaning up dotfiles symlinks..."
	@rm -f ~/.gitconfig
	@rm -f ~/.config/nvim
	@rm -f ~/.tmux.conf
	@rm -f ~/.config/i3/config
	@rm -f ~/.config/starship.toml

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

sync-configs: sync-git sync-nvim sync-tmux sync-i3 sync-starship
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

sync-i3:
	@echo "Syncing i3 configuration..."
	@chmod +x ./scripts/config-i3.sh
	@./scripts/config-i3.sh

sync-starship:
	@echo "Syncing Starship configuration..."
	@chmod +x ./scripts/config-starship.sh
	@./scripts/config-starship.sh

help:
	@echo "Dotfiles Setup Targets:"
	@echo "  all           : Setup complete system (git, neovim, tmux, i3, starship)"
	@echo "  git-setup     : Setup git configuration"
	@echo "  nvim-setup    : Install and configure Neovim"
	@echo "  tmux-setup    : Install and configure Tmux"
	@echo "  i3-setup      : Install and configure i3"
	@echo "  starship-setup: Install and configure Starship"
	@echo "  clean         : Remove dotfile symlinks"
	@echo "  test          : Run test suite"
	@echo "  doctor        : Check system health"
	@echo "  update        : Update all configurations"
	@echo "  sync-configs  : Sync all configurations"
	@echo "  sync-git      : Sync git configuration"
	@echo "  sync-nvim     : Sync neovim configuration"
	@echo "  sync-tmux     : Sync tmux configuration"
	@echo "  sync-i3       : Sync i3 configuration"
	@echo "  sync-starship : Sync starship configuration"
	@echo "  help          : Show this help message"
