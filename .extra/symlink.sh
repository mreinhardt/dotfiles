#!/usr/bin/env zsh


### zsh

ln -sfv "$DOTFILES_REPO_DIR/.zshenv" "$HOME"

# Can't symlink .zsh directly since files like .zsh_history are added dynamically
mkdir -p "$HOME/.zsh"
for zsh_source in $(find "$DOTFILES_REPO_DIR/.zsh" -maxdepth 1 | tail -n+2); do
    if [[ ! -d "$zsh_source" ]]; then
        ln -sfv "$zsh_source" "$HOME/.zsh"
    fi
done

mkdir -p "$HOME/.zsh/.zfunctions"
ln -sfv "$DOTFILES_REPO_DIR/.zsh/.prompts/sfz/prompt_sfz_setup" "$HOME/.zsh/.zfunctions"


### tig

ln -sfv "$DOTFILES_REPO_DIR/.tigrc" "$HOME"


### tmux

ln -sfv "$DOTFILES_REPO_DIR/.tmux.conf" "$HOME"
ln -sfv "$DOTFILES_REPO_DIR/.tmux" "$HOME"

