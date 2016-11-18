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
    IS_SSH=false
fi

curl -fLo "$INSTALLDIR/autoload/plug.vim" --create-dirs \
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
echo $VIMRC
ln -sfv "$VIMRC" "$HOME/.vimrc"

echo -n "Install plugins? [yN]"
read INSTALL_PLUGINS
if [[ $INSTALL_PLUGINS = "y" || $INSTALL_PLUGINS = "Y" ]]; then
    vim -u "$HOME/.vimrc" -c PlugInstall -c qa
fi

