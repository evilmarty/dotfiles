#!/usr/bin/env sh

DOTFILES_DIR=$HOME/.files

# Fix path ordering
export PATH="$HOME/.bin:./node_modules/.bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export EDITOR="vim"
export LESSEDIT="vim %f"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi

# Source all shell files
for f in $DOTFILES_DIR/shell/*/*; do source $f; done

export PATH="./bin:$PATH"

if [ -r "$HOME/.bashrc" ] ; then
  source "$HOME/.bashrc"
fi
