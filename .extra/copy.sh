#!/usr/bin/env zsh

cp -vn "$DOTFILES_REPO_DIR/.important_commands" "$HOME"


### conky
mkdir -p "$HOME/.conky"
cp -vi "$DOTFILES_REPO_DIR/.conkyrc" "$HOME"


### git

cp -vu "$DOTFILES_REPO_DIR/.gitconfig" "$HOME"


### lein

mkdir -p "$HOME/.lein"
cp -vu "$DOTFILES_REPO_DIR/.lein/profiles.clj" "$HOME/.lein"


### tmuxp

mkdir -p "$HOME/.tmuxp"
cp -vi "$DOTFILES_REPO_DIR/.tmuxp/default.yaml" "$HOME/.tmuxp"
