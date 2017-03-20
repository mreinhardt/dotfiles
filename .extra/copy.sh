#!/usr/bin/env zsh

cp -vn "$DOTFILES_REPO_DIR/.important_commands" "$HOME"


### bin

mkdir -p "$HOME/bin"
cp -vn "$DOTFILES_REPO_DIR/bin/nowplaying" "$HOME/bin"
cp -vn "$DOTFILES_REPO_DIR/bin/upgrade-all" "$HOME/bin"
cp -vn "$DOTFILES_REPO_DIR/bin/yeg" "$HOME/bin"


### conky
mkdir -p "$HOME/.conky"
cp -vn "$DOTFILES_REPO_DIR/.conkyrc" "$HOME"


### git

cp -vn "$DOTFILES_REPO_DIR/.gitconfig" "$HOME"


### lein

mkdir -p "$HOME/.lein"
cp -vn "$DOTFILES_REPO_DIR/.lein/profiles.clj" "$HOME/.lein"


### xmonad

cp -vn "$DOTFILES_REPO_DIR/.xsessionrc" "$HOME"
