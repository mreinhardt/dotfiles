# dotfiles

Zsh config lives in `.zsh/` (symlinked into `~/.zsh`, which is also `$ZDOTDIR`, set in `.zshenv`).

## zi plugin manager (`.zsh/.zshrc.zi`)

This repo uses z-shell/zi (the maintained fork of zinit), and pins it entirely under
`~/.zsh/.zi` instead of zi's default `~/.zi`. `.zshrc.zi` MUST set both:

- `ZI[HOME_DIR]="${HOME}/.zsh/.zi"` <- load-bearing
- `ZI[BIN_DIR]="${HOME}/.zsh/.zi/bin"`

`HOME_DIR` is the one that matters: zi hardcodes its runtime root to `$HOME/.zi` and ignores
`ZDOTDIR`, so without the pin the data lands in `~/.zi` while the installer (which does honor
`${ZDOTDIR:-$HOME}/.zi`) puts the binary in `~/.zsh/.zi` -> split install. `ZPFX` (zi's local
program prefix, aka "polaris") derives from `HOME_DIR`, so pinning it keeps polaris under `.zsh` too.

Gotchas:
- Moving the zi dir orphans absolute-path symlinks under `~/.zsh/.zi/completions/` (e.g. `_zi`),
  which surface as `compinit: no such file` warnings. Repoint them at the new path.
- The `zi` command name collides with zoxide (zoxide binds both `z` and `zi`). The fix lives in
  machine-local `~/.zsh/.zshrc.local` (untracked): re-source `~/.zsh/.zi/bin/zi.zsh` after
  `zoxide init` to reclaim `zi` for the manager while keeping `z` for zoxide. Not in this repo,
  so a fresh machine needs that line added locally.
