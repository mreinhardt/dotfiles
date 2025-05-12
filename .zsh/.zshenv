export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR=$(which nvim)
export PAGER=$(which less)

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )

[[ -r "${ZDOTDIR:-${HOME}}/.zshenv.zi" ]] && source "${ZDOTDIR:-$HOME}/.zshenv.zi"

if [[ -x $(command -v brew) ]]; then     OS_HAS_BREW=1; fi
if [[ -x $(command -v apt-get) ]]; then  OS_HAS_APT=1; fi
if [[ -x $(command -v yum) ]]; then      OS_HAS_YUM=1; fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
