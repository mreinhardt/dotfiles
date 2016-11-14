#!/usr/bin/env zsh

cp -vn "$DOTFILES_REPO_DIR/.important_commands" "$HOME"


### git

cp -vn "$DOTFILES_REPO_DIR/.gitconfig" "$HOME"


### lein

mkdir -p "$HOME/.lein"
cp -vn "$DOTFILES_REPO_DIR/.lein/profiles.clj" "$HOME/.lein"

