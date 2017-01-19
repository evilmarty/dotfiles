#!/usr/bin/env sh

DOTFILES_DIR=$HOME/.files

# Fix path ordering
export PATH="$HOME/.bin:./node_modules/.bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export EDITOR="nvim"
export LESSEDIT="vim %f"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Source all shell files
for f in $DOTFILES_DIR/shell/*/*; do source $f; done

export PATH="./bin:$PATH"

for file in $HOME/.{bash_prompt,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
