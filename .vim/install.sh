#!/usr/bin/env bash
HEREDIR="$(cd "$(dirname "$0")" && pwd)"

echo -n "Install custom .vimrc and .vim directory files? [yN] "
read -r PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then exit; fi

INSTALLDIR="$HOME/.vim"
NEOVIMDIR="$HOME/.config/nvim"
mkdir -p "$NEOVIMDIR"
mkdir -p "$HOME/.local/share/nvim"

curl -fLo "$INSTALLDIR/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p "$NEOVIMDIR/autoload/airline/themes"
curl -fLo "$NEOVIMDIR/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfv "$HEREDIR/base.vimrc" "$INSTALLDIR/base.vimrc"

mkdir -p "$INSTALLDIR/colors"
cp -rn "$HEREDIR/colors/"* "$INSTALLDIR/colors/."

ln -sfv "$HEREDIR/ftdetect" "$INSTALLDIR/ftdetect"
ln -sfv "$HEREDIR/ftplugin" "$INSTALLDIR/ftplugin"

VIMRC="$HEREDIR/.vimrc"
IDEAVIMRC="$HEREDIR/.ideavimrc"

echo "$VIMRC"
ln -sfv "$VIMRC" "$HOME/.vimrc"

echo "$IDEAVIMRC"
ln -sfv "$IDEAVIMRC" "$HOME/.ideavimrc"

if [[ -n $NEOVIMDIR ]]; then
    ln -sfv "$HEREDIR/base.vimrc" "$NEOVIMDIR/base.vimrc"
    mkdir -p "$NEOVIMDIR/colors"
    cp -rn "$HEREDIR/colors/"* "$NEOVIMDIR/colors/."
    cp -rn "$HEREDIR/autoload/airline/themes/"* "$NEOVIMDIR/autoload/airline/themes/."
    ln -sfv "$HEREDIR/ftdetect" "$NEOVIMDIR/ftdetect"
    ln -sfv "$HEREDIR/ftplugin" "$NEOVIMDIR/ftplugin"
    ln -sfv "$HEREDIR/.vimrc" "$NEOVIMDIR/init.vim"
fi

echo -n "Install plugins? [yN]"
read -r INSTALL_PLUGINS
if [[ $INSTALL_PLUGINS = "y" || $INSTALL_PLUGINS = "Y" ]]; then
    ln -sfv "$HEREDIR/coc-settings.json" "$INSTALLDIR/coc-settings.json"
    ln -sfv "$HEREDIR/coc-settings.json" "$NEOVIMDIR/coc-settings.json"
    vim -u "$HOME/.vimrc" -c PlugUpgrade -c PlugInstall -c PlugUpdate -c qa
    nvim -u "$NEOVIMDIR/init.vim" -c PlugUpgrade -c PlugInstall -c PlugUpdate -c qa
fi

