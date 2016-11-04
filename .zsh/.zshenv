export EDITOR=$(which vim)
export PAGER=$(which less)

# PATH customizations should go here
# export PATH=$PATH

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )

source ${ZDOTDIR:-$HOME}/.zshenv.grml

if [[ -x $(command -v brew) ]]; then     OS_HAS_BREW=1; fi
if [[ -x $(command -v apt-get) ]]; then  OS_HAS_APT=1; fi
if [[ -x $(command -v yum) ]]; then      OS_HAS_YUM=1; fi

