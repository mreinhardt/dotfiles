#!/usr/bin/env bash
HEREDIR="$(cd "$(dirname "$0")" && pwd)"

read -p "Install custom .vimrc and .vim directory files? [yN] " PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then exit; fi

read -p "Installing to SSH server? [yN] " IS_SSH
if [[ $IS_SSH = "y" || $IS_SSH = "Y" ]]; then
    INSTALLDIR="$HOME/.mvim"
    IS_SSH=true
else
    INSTALLDIR="$HOME/.vim"
    IS_SSH=false
fi

mkdir -p "$INSTALLDIR/colors"
cp "$HEREDIR/colors/*" "$INSTALLDIR/colors/."

curl -fLo "$INSTALLDIR/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfv "$HEREDIR/base.vimrc" "$INSTALLDIR/base.vimrc"

if [[ $IS_SSH == true ]]; then
    VIMRC="$HEREDIR/.ssh.vimrc"
else
    VIMRC="$HEREDIR/.vimrc"
fi
echo $VIMRC
ln -sfv "$VIMRC" "$HOME/.vimrc"

read -p "Install plugins? [yN]" INSTALL_PLUGINS
if [[ $INSTALL_PLUGINS = "y" || $INSTALL_PLUGINS = "Y" ]]; then
    vim -u "$HOME/.vimrc" -c PlugInstall -c qa
fi

