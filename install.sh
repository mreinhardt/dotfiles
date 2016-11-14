#!/usr/bin/env zsh

# Get current dir so this script can be run from anywhere.
export DOTFILES_REPO_DIR DOTFILES_EXTRA_DIR
DOTFILES_REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Run install scripts.
. ${DOTFILES_REPO_DIR}/.extra/update.sh
. ${DOTFILES_REPO_DIR}/.extra/copy.sh
. ${DOTFILES_REPO_DIR}/.extra/symlink.sh
${DOTFILES_REPO_DIR}/.extra/install.sh
. ${DOTFILES_REPO_DIR}/.extra/test.sh
. ${DOTFILES_REPO_DIR}/.extra/extra.sh

# Install custom vim configuration
${DOTFILES_REPO_DIR}/.vim/install.sh

