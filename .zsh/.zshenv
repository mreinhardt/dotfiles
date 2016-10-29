export EDITOR=$(which vim)
export PAGER=$(which less)

# PATH customizations should go here
# export PATH=$PATH

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )

