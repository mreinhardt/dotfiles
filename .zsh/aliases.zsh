### ALIASES ###

alias cmd='command'
alias emacs='XLIB_SKIP_ARGB_VISUALS=1 emacs24 -nw'
alias l=$(command -v ssh)
alias g=$(command -v git)
alias la='ls -laFh'
alias lad='ls -ldFh */'
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
alias tis="$(command -v tig) status"
alias tp="$(command -v tmuxp)"
alias tx="$(command -v tmux)"
alias vag="$(command -v vagrant)"
alias vim=$(command -v nvim)
alias vm=$(command -v nvim)
# alias nv=$(command -v nvim)
alias lgh="git lgg | head"
# alias gsed="git status -sb | tail -n+2 | awk '{print \$NF}' | xargs $(command -v nvim) -p"
alias ku=$(command -v kubectl)
alias tf=$(command -v terraform)
alias tg=$(command -v terragrunt)
