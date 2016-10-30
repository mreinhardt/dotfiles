#!/bin/bash -e

ln -sfv "$DOTFILES_REPO_DIR/.important_commands" ~
ln -sfv "$DOTFILES_REPO_DIR/.zshenv" ~

# Can't symlink .zsh directly since files like .zsh_history are added dynamically
mkdir -p ~/.zsh
for zsh_source in $(find $DOTFILES_REPO_DIR/.zsh -maxdepth 1 | tail -n+2); do
    if [[ ! -d "$zsh_source" ]]; then
        ln -sfv "$zsh_source" ~/.zsh
    fi
done

