[[ -r "${ZDOTDIR:-${HOME}}/.zshrc.pre" ]] && source "${ZDOTDIR:-${HOME}}/.zshrc.pre"
[[ -r "${ZDOTDIR:-${HOME}}/.zshrc.zi" ]] && source "${ZDOTDIR:-$HOME}/.zshrc.zi"
[[ -r "${ZDOTDIR:-${HOME}}/.zshrc.local.zi" ]] && source "${ZDOTDIR:-$HOME}/.zshrc.local.zi"
[[ -r "${ZDOTDIR:-${HOME}}/.zshrc.local" ]] && source "${ZDOTDIR:-$HOME}/.zshrc.local"
[[ -r "${ZDOTDIR:-${HOME}}/.zshrc.post.zi" ]] && source "${ZDOTDIR:-${HOME}}/.zshrc.post.zi"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/mreinhardt/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
