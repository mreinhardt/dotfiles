[[ -r ${ZDOTDIR:-${HOME}}/.zshrc.pre ]] && source ${ZDOTDIR:-${HOME}}/.zshrc.pre
source ${ZDOTDIR:-$HOME}/.zshrc.grml
source ${ZDOTDIR:-$HOME}/.zshrc.local.grml
[[ -r ${ZDOTDIR:-${HOME}}/.zshrc.post ]] && source ${ZDOTDIR:-${HOME}}/.zshrc.post
