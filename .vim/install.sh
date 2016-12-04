#!/usr/bin/env bash
HEREDIR="$(cd "$(dirname "$0")" && pwd)"

echo -n "Install custom .vimrc and .vim directory files? [yN] "
read PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then exit; fi

echo -n "Installing to SSH server? [yN] "
read IS_SSH
if [[ $IS_SSH = "y" || $IS_SSH = "Y" ]]; then
    INSTALLDIR="$HOME/.mvim"
    IS_SSH=true
else
    INSTALLDIR="$HOME/.vim"
    NEOVIMDIR="$HOME/.config/nvim"
    mkdir -p "$NEOVIMDIR"
    mkdir -p "$HOME/.local/share/nvim"
    IS_SSH=false
fi

curl -fLo "$INSTALLDIR/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p "$NEOVIMDIR/autoload"
curl -fLo "$NEOVIMDIR/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfv "$HEREDIR/base.vimrc" "$INSTALLDIR/base.vimrc"

mkdir -p "$INSTALLDIR/colors"
cp -rn "$HEREDIR/colors/"* "$INSTALLDIR/colors/."

ln -sfv "$HEREDIR/ftdetect" "$INSTALLDIR/ftdetect"
ln -sfv "$HEREDIR/ftplugin" "$INSTALLDIR/ftplugin"

if [[ $IS_SSH == true ]]; then
    VIMRC="$HEREDIR/.ssh.vimrc"
else
    VIMRC="$HEREDIR/.vimrc"
fi
echo "$VIMRC"
ln -sfv "$VIMRC" "$HOME/.vimrc"

if [[ -n $NEOVIMDIR ]]; then
    ln -sfv "$HEREDIR/base.vimrc" "$NEOVIMDIR/base.vimrc"
    mkdir -p "$NEOVIMDIR/colors"
    cp -rn "$HEREDIR/colors/"* "$NEOVIMDIR/colors/."
    ln -sfv "$HEREDIR/ftdetect" "$NEOVIMDIR/ftdetect"
    ln -sfv "$HEREDIR/ftplugin" "$NEOVIMDIR/ftplugin"
    ln -sfv "$HEREDIR/.vimrc" "$NEOVIMDIR/init.vim"
fi

echo -n "Install plugins? [yN]"
read INSTALL_PLUGINS
if [[ $INSTALL_PLUGINS = "y" || $INSTALL_PLUGINS = "Y" ]]; then
    vim -u "$HOME/.vimrc" -c PlugUpgrade -c PlugInstall -c PlugUpdate -c qa
    nvim -u "$NEOVIMDIR/init.vim" -c PlugUpgrade -c PlugInstall -c PlugUpdate -c qa
fi

