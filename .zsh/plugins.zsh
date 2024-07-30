### PLUGINS ###

# zoxide and fasd
if [[ $(command -v zoxide) ]]; then
    eval "$(zoxide init zsh --cmd c --hook pwd)"
    alias cc='ci'
    v () { c "$1" && vim . }
    vv () { ci "$1" && vim . }
elif [[ $(command -v fasd) ]]; then
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

if [[ $(command -v fzf) ]]; then
    if [ -f ~/.fzf.zsh ]; then
        source ~/.fzf.zsh
    fi
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="command find -L . \( -fstype 'dev' -o -fstype 'proc' -o -ipath '*/.git/*' \) -prune -o -type d -print 2> /dev/null"
fi

