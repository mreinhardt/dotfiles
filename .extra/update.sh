#!/bin/bash -e

# Update dotfiles repo itself.
if [ -d "$DOTFILES_REPO_DIR/.git" ]; then
    git --work-tree="$DOTFILES_REPO_DIR" \
        --git-dir="$DOTFILES_REPO_DIR/.git" \
        pull origin master
fi
