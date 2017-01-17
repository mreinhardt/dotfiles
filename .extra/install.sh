#!/usr/bin/env zsh

echo -n "Install packages? [yN] "
read PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then exit; fi

PLATFORM=$(uname -s)
APT=$(command -v apt-get)
BREW=$(command -v brew)


### Ubuntu
if [[ -n $APT ]]; then

    # add repositories
    sudo $APT install --yes software-properties-common
    sudo add-apt-repository ppa:aacebedo/fasd
    sudo add-apt-repository ppa:neovim-ppa/unstable

    # update
    sudo $APT update

    # install packages
    sudo $APT install --yes cmake \
                            dconf-editor \
                            fasd \
                            firefox \
                            git \
                            htop \
                            ipython \
                            java-common \
                            lua5.3 \
                            lynx \
                            meld \
                            mkdocs \
                            neovim \
                            nginx \
                            nodejs \
                            npm \
                            openssh-server \
                            pandoc \
                            pylint \
                            python-dev \
                            python-openssl \
                            python2.7-dev \
                            python3 \
                            python3.5 \
                            redshift \
                            ruby \
                            ruby2.3 \
                            silversearcher-ag \
                            subversion \
                            suckless-tools \
                            tig \
                            tmux \
                            unetbootin \
                            vagrant \
                            vim \
                            virtualbox \
                            weechat \
                            workrave \
                            xclip \
                            xdotool || true

### OSX
elif [[ $PLATFORM == "Darwin" ]]; then

    # install xcode command line tools
    /usr/bin/xcode-select --install || true

    # install brew
    if [[ -z $BREW ]]; then
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

