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
    sudo add-apt-repository --yes ppa:aacebedo/fasd
    sudo add-apt-repository --yes ppa:neovim-ppa/unstable
    sudo add-apt-repository --yes ppa:peterlevi/ppa  # variety
    # weechat
    sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
    sudo bash -c "echo 'deb https://weechat.org/ubuntu xenial main' > /etc/apt/sources.list.d/weechat.list"
    sudo bash -c "echo 'deb-src https://weechat.org/ubuntu xenial main' >> /etc/apt/sources.list.d/weechat.list"
    # polybar
    wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
    sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'

    # update
    sudo $APT update

    # remove packages
    sudo $APT purge --yes apache2 || true
    sudo $APT autoremove --yes || true

    # install packages
    sudo $APT install --yes apt-transport-https \
                            cabal-install \
                            cmake \
                            conky-all \
                            dconf-editor \
                            fasd \
                            feh \
                            firefox \
                            flake8 \
                            font-manager \
                            git \
                            htop \
                            ipython \
                            java-common \
                            libghc-xmonad-contrib-dev \
                            libghc-xmonad-dev \
                            lua5.3 \
                            lynx \
                            meld \
                            mkdocs \
                            nemo \
                            neovim \
                            nginx \
                            nodejs \
                            npm \
                            openssh-server \
                            pandoc \
                            polybar \
                            pylint \
                            python-dev \
                            python-openssl \
                            python-pip \
                            python2.7-dev \
                            python3 \
                            python3.5 \
                            python3-pip \
                            redshift \
                            ruby \
                            ruby2.3 \
                            shellcheck \
                            silversearcher-ag \
                            subversion \
                            suckless-tools \
                            terminology \
                            tig \
                            tmux \
                            udiskie \
                            unetbootin \
                            vagrant \
                            variety \
                            vim \
                            vim-python-jedi \
                            virtualbox \
                            weechat-curses \
                            weechat-plugins \
                            wmctrl \
                            workrave \
                            xclip \
                            xdotool \
                            xfce4-power-manager \
                            xli \
                            xmonad \
                            || true

    # install neovim python
    pip install --upgrade neovim \
                          pip
    pip3 install --upgrade neovim \
                           pip
    pip3 install --upgrade --user tmuxp

    # install playerctl
    latest_playerctl_release=$(curl -s https://api.github.com/repos/acrisci/playerctl/releases \
        | grep browser_download_url \
        | head -n1 \
        | cut -d'"' -f4)
    wget -O /tmp/playerctl.deb "$latest_playerctl_release"
    sudo dpkg -i /tmp/playerctl.deb

    # install yeganesh
    cabal update
    cabal install -g --user yeganesh

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

