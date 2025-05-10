### ALIASES ###

alias cmd='command'
alias cat='lolcat -ft -F 0.0666 -p 6.66'
alias less='less -R'
alias emacs='XLIB_SKIP_ARGB_VISUALS=1 emacs24 -nw'
# alias l=$(command -v ssh)
alias g=$(command -v git)
alias pylf="$(command -v ruff) check --fix --ignore-noqa --output-format concise ."
alias glci="$(command -v golangci-lint) run --out-format=colored-tab"
# alias la='ls -laFh'
# alias lad='ls -ldFh */'
alias ls='eza -Z --color=always --git --git-repos --show-symlinks --follow-symlinks'
alias la='eza -laZ --color=always --icons --git --git-repos --show-symlinks --follow-symlinks'
alias lad='eza -ldZ --color=always --icons --git --git-repos --show-symlinks --follow-symlinks'
alias laf='eza -lfZ --color=always --icons --git --git-repos --show-symlinks --follow-symlinks'
alias logout="pkill -u $(whoami)"
alias lsb="echo 'Largest files'; ls -flh *(.OL[1,10])"
alias lst="echo 'Smallest files'; ls -Srl *(.oL[1,10])"
alias lsn="echo 'Newest files'; ls -rtlh *(D.om[1,10])"
alias lso="echo 'Oldest files'; ls -rtlh *(D.Om[1,10])"
alias lsnd="echo 'Newest dirs'; ls -rthdl *(/om[1,10]) .*(D/om[1,10])"
alias lsod="echo 'Oldest dirs'; ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])"
if [[ $(uname -s) != "Darwin" ]]; then
    alias pbcopy="$(command -v xclip) -selection clipboard"
    alias pbpaste="$(command -v xclip) -selection clipboard -o"
fi
alias rgn="$(command -v rg) --no-config"
alias rgu="$(command -v rg) -Luuu"
alias tis="$(command -v tig) status"
alias tp="$(command -v tmuxp)"
alias tx="$(command -v tmux)"
alias txn="$(command -v tmuxinator)"
alias vag="$(command -v vagrant)"
alias vim=$(command -v nvim)
alias vm=$(command -v nvim)
# alias nv=$(command -v nvim)
alias lgh="git lgg | head"
# alias gsed="git status -sb | tail -n+2 | awk '{print \$NF}' | xargs $(command -v nvim) -p"
alias ku=$(command -v kubectl)
alias tf=$(command -v terraform)
alias tg=$(command -v terragrunt)
