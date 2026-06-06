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

# Machine-local Claude env. Must be in the real shell env (Claude Code applies
# settings.json `env` too late for startup auth + model resolution). Sourced if
# present; no-op on machines without them.
#   env.sh     - non-secret (base URL, model mappings, flags), tracked in overlay
#   secrets.env - ANTHROPIC_AUTH_TOKEN, gitignored, never committed
[ -f "$HOME/claude/env.sh" ] && source "$HOME/claude/env.sh"
[ -f "$HOME/claude/secrets.env" ] && source "$HOME/claude/secrets.env"
