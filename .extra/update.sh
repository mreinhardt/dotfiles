#!/bin/bash -e

git_cmd () {
    $(which git) --work-tree="$DOTFILES_REPO_DIR" --git-dir="$DOTFILES_REPO_DIR/.git" $@
}

# Update dotfiles repo itself.
if [ -d "$DOTFILES_REPO_DIR/.git" ]; then
    git_cmd fetch origin
    git_cmd pull origin master
fi
