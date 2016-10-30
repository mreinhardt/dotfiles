#!/bin/bash -e

# Get current dir so this script can be run from anywhere.
export DOTFILES_REPO_DIR DOTFILES_EXTRA_DIR
DOTFILES_REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_EXTRA_DIR="$HOME/.extra"

