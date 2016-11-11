### PLUGINS ###

# fasd
if [[ $(command -v fasd) ]]; then 
    fasd_cache="$HOME/.fasd-init-zsh"
    if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
      fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
    fi
    source "$fasd_cache"
    unset fasd_cache
    alias c='fasd_cd -d'
    alias cc='fasd_cd -d -i'
    alias v='fasd -e vim'
    alias vv='fasd -i -e vim'
fi

