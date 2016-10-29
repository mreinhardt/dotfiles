About
=====

sfz prompt is an evolution of lean prompt which itself is a rewrite of pure.

Features:

* Defaults to a sparse setup, only showing information needed at the moment.
* When tmux is active it shows a yellow `™`. If you don't want this indicator,
you can set `PROMPT_SFZ_TMUX=""`.
* Show remote host if logged in through SSH.
* All in one line, most stuff in the right prompt, leaving the left prompt clean.
* Shows background jobs.
* Show git repo status indicators.
* Shortens path in fish shell style, to disable this set
`PROMPT_SFZ_PATH_UNTRUNCATED=1`.
* Shows execution time of long jobs. This defaults to 5 seconds but can be
changed by settings `PROMPT_SFZ_CMD_MAX_EXEC_TIME`.

sfz starts with only 2 characters on the screen:

```
~ §
```

All other information is omitted and shown only when needed.

Instalation
===========

You can install the prompt in the standard `zsh` way by adding the
`prompt_sfz_setup` file to your `$fpath` and running `prompt sfz` somewhere in
your `.zshrc`. For example, you could clone this repo and run:

```
ln -s /path/to/this/repo/prompt_sfz_setup $HOME/.zsh/.zfunctions/prompt_sfz_setup
```

And in your `.zshrc` add:

```
fpath=( "$HOME/.zsh/.zfunctions" $fpath )
prompt sfz
```

Alternatively if you use [zgen](https://github.com/tarjoilija/zgen) you can add
the following to your `~/.zshrc`:

```
zgen load mreinhardt/sfz-prompt.zsh
```

Then you can force reload `zgen` with `zgen reset && source ~/.zshrc`.
