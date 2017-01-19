#!/usr/bin/env sh

DOTFILES_DIR=$HOME/.files

# Fix path ordering
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Source all shell files
for f in $DOTFILES_DIR/shell/*/*; do source $f; done

for file in $HOME/.{bash_prompt,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
