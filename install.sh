#!/usr/bin/env zsh

# Get current dir so this script can be run from anywhere.
export DOTFILES_REPO_DIR DOTFILES_EXTRA_DIR
PARENT_SHELL="$(ps -p $$ | tail -n1 | awk '{print $NF}')"
SOURCE_FILE="$(if [[ $PARENT_SHELL == *bash ]]; then echo "${BASH_SOURCE[0]}"; else echo "$0"; fi)"
DOTFILES_REPO_DIR="$(cd "$(dirname "$SOURCE_FILE")" && pwd)"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Run install scripts.
. "${DOTFILES_REPO_DIR}/.extra/update.sh"
. "${DOTFILES_REPO_DIR}/.extra/lecture.sh"
. "${DOTFILES_REPO_DIR}/.extra/copy.sh"
. "${DOTFILES_REPO_DIR}/.extra/symlink.sh"
"${DOTFILES_REPO_DIR}/.extra/install.sh"
. "${DOTFILES_REPO_DIR}/.extra/test.sh"
. "${DOTFILES_REPO_DIR}/.extra/extra.sh"

# Install custom vim configuration
"${DOTFILES_REPO_DIR}/.vim/install.sh"
