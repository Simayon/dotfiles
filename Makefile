.PHONY: all git-setup clean

all: git-setup

git-setup:
	@echo "Installing git-delta..."
	@cargo install git-delta
	@echo "Configuring git with delta settings..."
	@git config --global core.pager delta
	@git config --global interactive.diffFilter 'delta --color-only'
	@git config --global delta.navigate true
	@git config --global merge.conflictStyle zdiff3

clean:
	@echo "Cleaning up (no specific cleanup needed for git-delta)"

help:
	@echo "Targets:"
	@echo "  all       : Setup system (default)"
	@echo "  git-setup : Setup git configuration"
	@echo "  clean     : Cleanup (no-op)"
	@echo "  help      : Show this help message"
