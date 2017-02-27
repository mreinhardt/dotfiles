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
    # weechat
    sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
    sudo bash -c "echo 'deb https://weechat.org/ubuntu xenial main' > /etc/apt/sources.list.d/weechat.list"
    sudo bash -c "echo 'deb-src https://weechat.org/ubuntu xenial main' >> /etc/apt/sources.list.d/weechat.list"

    # update
    sudo $APT update

    # install packages
    sudo $APT install --yes apt-transport-https \
                            cmake \
                            dconf-editor \
                            fasd \
                            firefox \
                            flake8 \
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
                            shellcheck \
                            silversearcher-ag \
                            subversion \
                            suckless-tools \
                            tig \
                            tmux \
                            unetbootin \
                            vagrant \
                            vim \
                            vim-python-jedi \
                            virtualbox \
                            weechat-curses \
                            weechat-plugins \
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

