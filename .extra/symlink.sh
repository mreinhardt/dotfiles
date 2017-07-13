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


### bin

mkdir -p "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/0x2ip" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/gpull" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/gpush" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/grr" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/nowplaying" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/otp" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/randman" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/upgrade-all" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/wminfo" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/xmc" "$HOME/bin"
ln -sfv "$DOTFILES_REPO_DIR/bin/yeg" "$HOME/bin"
mkdir -p "$HOME/Pictures/artstation"
ln -sfv "$DOTFILES_REPO_DIR/bin/wget-artstation-bgs.sh" "$HOME/Pictures/artstation"


### config

ln -sfv "$DOTFILES_REPO_DIR/.config/compton.conf" "$HOME/.config"
mkdir -p "$HOME/.config/polybar"
ln -sfv "$DOTFILES_REPO_DIR/.config/polybar/config" "$HOME/.config/polybar"


### conky

ln -sfv "$DOTFILES_REPO_DIR/.conky/conky_scripts.lua" "$HOME/.conky"
ln -sfv "$DOTFILES_REPO_DIR/.conky/cpuhogs" "$HOME/.conky"
ln -sfv "$DOTFILES_REPO_DIR/.conky/netrxkb" "$HOME/.conky"
ln -sfv "$DOTFILES_REPO_DIR/.conky/nettxkb" "$HOME/.conky"
ln -sfv "$DOTFILES_REPO_DIR/.conky/vmhogs" "$HOME/.conky"


### tig

ln -sfv "$DOTFILES_REPO_DIR/.tigrc" "$HOME"


### tmux

ln -sfv "$DOTFILES_REPO_DIR/.tmux.conf" "$HOME"
ln -sfv "$DOTFILES_REPO_DIR/.tmux" "$HOME"


### xmonad

mkdir -p "$HOME/.xmonad"
ln -sfv "$DOTFILES_REPO_DIR/.xmonad/xmonad.hs" "$HOME/.xmonad"
ln -sfv "$DOTFILES_REPO_DIR/.Xresources" "$HOME"
