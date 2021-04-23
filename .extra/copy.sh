#!/usr/bin/env zsh

cp -vn "$DOTFILES_REPO_DIR/.important_commands" "$HOME"


### conky
mkdir -p "$HOME/.conky"
cp -vi "$DOTFILES_REPO_DIR/.conkyrc" "$HOME"


### git

if [[ ! -f "$HOME/.gitconfig" ]]; then
    cp -v "$DOTFILES_REPO_DIR/.gitconfig" "$HOME"
fi


### lein

mkdir -p "$HOME/.lein"
if [[ ! -f "$HOME/.lein/profiles.clj" ]]; then
    cp -v "$DOTFILES_REPO_DIR/.lein/profiles.clj" "$HOME/.lein"
fi


### tmuxp

mkdir -p "$HOME/.tmuxp"
cp -vi "$DOTFILES_REPO_DIR/.tmuxp/default.yaml" "$HOME/.tmuxp"
cp -vi "$DOTFILES_REPO_DIR/.tmuxp/prime.yaml" "$HOME/.tmuxp"
cp -vi "$DOTFILES_REPO_DIR/.tmuxp/omega.yaml" "$HOME/.tmuxp"
