#!/usr/bin/env sh

# Fix path ordering
export PATH="~/bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Source all shell files
for f in ~/.bash_profile.d/*/*; do source $f; done

for file in ~/.{bash_prompt,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
