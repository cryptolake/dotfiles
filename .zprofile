#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.


# Adds `~/.local/bin` to $PATH

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':'):$HOME/.local/share/cargo/bin:$HOME/.luarocks/bin:$GOPATH/bin"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

