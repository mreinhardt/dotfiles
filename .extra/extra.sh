#!/usr/bin/env zsh

# Install custom extra stuff.
mkdir -p "$DOTFILES_EXTRA_DIR"
if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi

