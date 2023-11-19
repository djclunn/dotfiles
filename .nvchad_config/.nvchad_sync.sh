#!/bin/bash
# echo "push = push from local to remote"
# echo "put = put from user dir to nvchad dir"

function confirm() {
    read -p "$1 (y/n): " choice
    case "$choice" in 
      y|Y ) return 0 ;;
      n|N ) return 1 ;;
      * ) echo "Invalid choice. Please enter 'y' or 'n'." ;;
    esac
}

function perform_push() {
    echo "Executing push function. Pushing nvchad custom settings to remote."

    # Confirm before overwriting
    if confirm "Are you sure you want to push and overwrite the contents of ~/.nvchad_config with ~/.config/nvim/lua/custom?"; then
        # Copy files from ~/.config/nvim/lua/custom to ~/.nvchad_config
        rsync -av --delete ~/.config/nvim/lua/custom/ ~/.nvchad_config/
        
        commit_message="$2"
        echo "Executing push function with commit message: $commit_message"
        # sync between custom folder and config folder
        rsync -avu ~/.config/nvim/lua/custom/ ~/.nvchad_config/
        $config add ~/.nvchad_config/*

        $config commit -m "$commit_message"
        $config push
    else
        echo "Push operation aborted."
        exit 0
    fi
}

function perform_put() {
    echo "Executing put function. Putting .nvchad_config local dir contents into nvchad foler."

    # Confirm before overwriting
    if confirm "Have you performed push already to store existing changes? Are you sure you want to overwrite the contents of ~/.config/nvim/lua/custom with ~/.nvchad_config?"; then
        # Overwrite the contents of ~/.config/nvim/lua/custom with ~/.nvchad_config
        rsync -avu --delete --exclude="DONT_EDIT_HERE.md" ~/.nvchad_config/ ~/.config/nvim/lua/custom/
    else
        echo "Pull operation aborted."
        exit 0
    fi
}

# this same alias is in .zshrc
config="/opt/homebrew/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER"
if [[ "$1" == "push" ]]; then
    if [ -z "$2" ]; then
        echo "Needs a commit message."
        exit 1
    fi
    perform_push "$@"
elif [[ "$1" == "put" ]]; then
    perform_put
else
    echo "Invalid argument. Please use 'push' or 'put'."
    echo "push = push updated config from local to remote"
    echo "put = put from user dir to nvchad dir. requires config pull if you want the changes in the remote to be copied."
    exit 1
fi
