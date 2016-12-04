#!/usr/bin/env zsh

echo -n "Install packages? [yN] "
read PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then exit; fi

### OSX
if [[ $(uname -s) == "Darwin" ]]; then

    # install xcode command line tools
    /usr/bin/xcode-select --install || true

    # install brew
    if [[ -z $(command -v brew) ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # display potential issues
    brew doctor

    # update clean
    pushd "$(brew --repo)"
    git fetch && git reset --hard origin/master
    brew update
    popd

    # install packages
    brew install automake \
                 cmake \
                 coreutils \
                 curl \
                 fasd \
                 fzf \
                 gnupg \
                 htop-osx \
                 leiningen \
                 mobile-shell \
                 neovim/neovim/neovim \
                 nginx \
                 node \
                 pandoc \
                 postgresql \
                 rogue \
                 the_silver_searcher \
                 tig \
                 tmux \
                 tree \
                 vim \
                 w3m \
                 wget || true

    brew upgrade --cleanup
    brew prune

fi

