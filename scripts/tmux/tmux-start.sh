#!/bin/bash

# Constants
PROJECTS_DIR="${HOME}/Projects"
REPO_PATH=""

# Colors for UI
GREEN="\033[32m"
CYAN="\033[36m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

# Create a tmux session with enhanced layout
function create_tmux_session() {
    local session_name
    session_name="$(basename "$REPO_PATH")"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo -e "${YELLOW}Session '$session_name' already exists. Options:${RESET}"
        echo -e "1) Switch to existing session"
        echo -e "2) Create new session"
        echo -e "q) Quit"
        read -r -p "Choose option (1/2/q): " session_choice

        case "$session_choice" in
            1)
                if [[ -n "$TMUX" ]]; then
                    tmux switch-client -t "$session_name"
                else
                    tmux attach-session -t "$session_name"
                fi
                return
                ;;
            2)
                tmux kill-session -t "$session_name"
                ;;
            q|Q)
                echo -e "${CYAN}Quitting.${RESET}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice, quitting.${RESET}"
                exit 1
                ;;
        esac
    fi

    # If we're inside tmux, create a new session without attaching
    if [[ -n "$TMUX" ]]; then
        # Create the new session without attaching
        tmux new-session -d -s "$session_name"

        # Set up windows and send commands
        window=0
        tmux rename-window -t "$session_name:$window" 'Git'
        tmux send-keys -t "$session_name:$window" 'git fetch --prune --all' C-m
        tmux send-keys -t "$session_name:$window" 'lazygit' C-m Tab

        window=1
        tmux new-window -t "$session_name:$window" -n 'Editor'
        tmux send-keys -t "$session_name:$window" 'nvim' C-m

        window=2
        tmux new-window -t "$session_name:$window" -n 'Shell'

        # Set help message in status line
        tmux set-option -t "$session_name" status-right "#[fg=yellow]Ctrl+B D to detach | Q to quit"

        # Switch to the new session
        echo -e "${GREEN}Switching to tmux session: $session_name${RESET}"
        tmux switch-client -t "$session_name:$window"
    else
        # Original behavior for when we're not in tmux
        tmux new-session -d -s "$session_name"

        window=0
        tmux rename-window -t "$session_name:$window" 'Git'
        tmux send-keys -t "$session_name:$window" 'git fetch --prune --all' C-m
        tmux send-keys -t "$session_name:$window" 'lazygit' C-m Tab

        window=1
        tmux new-window -t "$session_name:$window" -n 'Editor'
        tmux send-keys -t "$session_name:$window" 'nvim' C-m

        window=2
        tmux new-window -t "$session_name:$window" -n 'Shell'

        # Set help message in status line
        tmux set-option -t "$session_name" status-right "#[fg=yellow]Ctrl+B D to detach | Q to quit"

        # Attach to the session
        echo -e "${GREEN}Attaching to tmux session: $session_name${RESET}"
        tmux attach-session -t "$session_name:$window"
    fi
}

# Help text
function show_help() {
    echo -e "${YELLOW}Available Commands:${RESET}"
    echo -e "  ${CYAN}↑/↓${RESET}    Navigate through repositories"
    echo -e "  ${CYAN}Enter${RESET}  Select repository"
    echo -e "  ${CYAN}Ctrl+R${RESET} Refresh repository list"
    echo -e "  ${CYAN}Ctrl+C${RESET} Quit at any time"
    echo -e "  ${CYAN}q${RESET}      Quit from main menu"
    echo -e "  ${CYAN}h${RESET}      Show this help message"
}

# Check for onefetch installation
function check_onefetch() {
    if ! command -v onefetch &> /dev/null; then
        echo -e "${RED}onefetch is not installed.${RESET} Would you like to install it? (y/n/q to quit)"
        read -r install_choice
        case "$install_choice" in
            y|Y)
                if command -v apt &> /dev/null; then
                    sudo apt update && sudo apt install -y onefetch
                elif command -v brew &> /dev/null; then
                    brew install onefetch
                else
                    echo -e "${RED}Unsupported package manager. Please install onefetch manually.${RESET}"
                    return 1
                fi
                ;;
            n|N)
                echo -e "${CYAN}Skipping onefetch installation.${RESET}"
                ;;
            q|Q)
                echo -e "${CYAN}Quitting.${RESET}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice, quitting.${RESET}"
                exit 1
                ;;
        esac
    fi
}

# Find a Git repository with enhanced UI
function find_project_repo() {
    if [[ ! -d "$PROJECTS_DIR" ]]; then
        echo -e "${RED}Error: Projects directory not found at $PROJECTS_DIR${RESET}"
        return 1
    fi

    check_onefetch || return 1

    local find_command
    if command -v fdfind &> /dev/null; then
        find_command="fdfind --hidden --type d --no-ignore '^\.git$' \"$PROJECTS_DIR\" --exec echo {//}"
    else
        find_command="find \"$PROJECTS_DIR\" -type d -name \".git\" -prune -exec dirname {} \;"
    fi

    echo -e "${CYAN}Searching for repositories...${RESET}"
    show_help

    local selected_repo
    selected_repo=$(eval $find_command | sort -u | fzf --ansi \
        --preview "onefetch '{}'" \
        --preview-window=right:60%:wrap \
        --header "Repository Browser - Press 'h' for help" \
        --prompt "Select repository (q to quit): " \
        --bind "ctrl-r:reload(echo Searching... && sleep 1 && $find_command)" \
        --bind "h:preview(echo -e '$(show_help)')" \
        --bind "q:abort")

    if [[ -z "$selected_repo" ]]; then
        if [[ $? -eq 130 || $? -eq 1 ]]; then
            echo -e "${CYAN}Quitting.${RESET}"
            exit 0
        fi
        echo -e "${CYAN}No repository selected.${RESET}"
        return 0
    fi

    REPO_PATH="$selected_repo"
    echo -e "${GREEN}Selected repository: $REPO_PATH${RESET}"
}

# Initialize the selected repository
function initialize_repo() {
    cd "$REPO_PATH" || { echo -e "${RED}Failed to enter repository${RESET}"; return 1; }
    if [[ -d .git ]]; then
        echo -e "${CYAN}Fetching origin...${RESET}"
        git fetch origin || { echo -e "${RED}Failed to fetch origin${RESET}"; return 1; }
        onefetch
    fi
}

# Main TUI Function
function main() {
    # Trap Ctrl+C
    trap 'echo -e "\n${CYAN}Script interrupted. Exiting...${RESET}"; exit 0' INT

    find_project_repo || return
    [[ -z "$REPO_PATH" ]] && exit 0
    initialize_repo || return
    create_tmux_session
}

# Execute the main function
main

