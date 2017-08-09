#!/usr/bin/env zsh

echo -n "Install packages? [yN] "
read PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then exit; fi

PLATFORM=$(uname -s)
if [[ -n $(command -v lsb_release) ]]; then
    LSB_ID=$(lsb_release -s -i)
fi
APT=$(command -v apt-get)
BREW=$(command -v brew)
EOPKG=$(command -v eopkg)
PACMAN=$(command -v pacman)


### Ubuntu
if [[ -n $APT ]]; then

    # add repositories
    sudo $APT install --yes software-properties-common
    sudo add-apt-repository --yes ppa:aacebedo/fasd
    sudo add-apt-repository --yes ppa:neovim-ppa/unstable
    sudo add-apt-repository --yes ppa:peterlevi/ppa  # variety
    sudo add-apt-repository --yes ppa:webupd8team/terminix  # tilix
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
                            cmake \
                            conky-all \
                            compton \
                            dconf-editor \
                            fasd \
                            feh \
                            flake8 \
                            font-manager \
                            git \
                            hsetroot \
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
                            rofi \
                            ruby \
                            ruby2.3 \
                            shellcheck \
                            silversearcher-ag \
                            subversion \
                            suckless-tools \
                            tig \
                            tilix \
                            tmux \
                            udiskie \
                            unetbootin \
                            vagrant \
                            vim \
                            vim-python-jedi \
                            weechat-curses \
                            weechat-plugins \
                            wget \
                            wmctrl \
                            workrave \
                            xclip \
                            xdotool \
                            xfce4-power-manager \
                            xli \
                            xmonad \
                            || true

    # install playerctl
    latest_playerctl_release=$(curl -s https://api.github.com/repos/acrisci/playerctl/releases \
        | grep browser_download_url \
        | head -n1 \
        | cut -d'"' -f4)
    wget -O /tmp/playerctl.deb "$latest_playerctl_release"
    sudo dpkg -i /tmp/playerctl.deb

### Manjaro
elif [[ -n $PACMAN ]]; then

    # install packages
    sudo $PACMAN -S --noconfirm \
                    cmake \
                    conky \
                    curl \
                    dconf-editor \
                    fasd \
                    fzf \
                    htop \
                    ipython \
                    lynx \
                    neovim \
                    nginx \
                    openssh \
                    openssl \
                    pandoc \
                    playerctl \
                    python-pip \
                    python2 \
                    redshift \
                    shellcheck \
                    the_silver_searcher \
                    tig \
                    tmux \
                    udiskie \
                    unetbootin \
                    vim \
                    weechat \
                    wget \
                    wmctrl \
                    xclip \
                    xdotool \
                    xfce4-power-manager \
                    xmonad \
                    yaourt \
                    || true

    yaourt -S --noconfirm \
              community/rofi \
              hsetroot \
              || true

### Solus
elif [[ -n $EOPKG ]]; then

    # install packages
    sudo $EOPKG install \
                cmake \
                curl \
                dconf-editor \
                fzf \
                htop \
                lynx \
                neovim \
                nginx \
                openssh \
                openssl \
                pandoc \
                playerctl \
                ranger \
                redshift \
                rofi \
                shellcheck \
                silver-searcher \
                tig \
                tmux \
                vim \
                weechat \
                wget \
                xclip \
                || true

    sudo $EOPKG upgrade
    sudo $EOPKG clean

### OSX
elif [[ $PLATFORM == "Darwin" ]]; then

    # install xcode command line tools
    /usr/bin/xcode-select --install 2> /dev/null || true

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
                 python3 \
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

# install neovim python
pip2 install --upgrade neovim \
                       pip
pip3 install --upgrade neovim \
                       pip
pip3 install --upgrade --user tmuxp

