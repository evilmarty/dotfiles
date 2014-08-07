#!/usr/bin/env sh

DOTFILES_DIR=$HOME/.dotfiles

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

### COLOURS ###
txtblk="\[\e[0;30m\]" # Black - Regular
txtred="\[\e[0;31m\]" # Red
txtgrn="\[\e[0;32m\]" # Green
txtylw="\[\e[0;33m\]" # Yellow
txtblu="\[\e[0;34m\]" # Blue
txtpur="\[\e[0;35m\]" # Purple
txtcyn="\[\e[0;36m\]" # Cyan
txtwht="\[\e[0;37m\]" # White
bldblk="\[\e[1;30m\]" # Black - Bold
bldred="\[\e[1;31m\]" # Red
bldgrn="\[\e[1;32m\]" # Green
bldylw="\[\e[1;33m\]" # Yellow
bldblu="\[\e[1;34m\]" # Blue
bldpur="\[\e[1;35m\]" # Purple
bldcyn="\[\e[1;36m\]" # Cyan
bldwht="\[\e[1;37m\]" # White
unkblk="\[\e[4;30m\]" # Black - Underline
undred="\[\e[4;31m\]" # Red
undgrn="\[\e[4;32m\]" # Green
undylw="\[\e[4;33m\]" # Yellow
undblu="\[\e[4;34m\]" # Blue
undpur="\[\e[4;35m\]" # Purple
undcyn="\[\e[4;36m\]" # Cyan
undwht="\[\e[4;37m\]" # White
bakblk="\[\e[40m\]"   # Black - Background
bakred="\[\e[41m\]"   # Red
badgrn="\[\e[42m\]"   # Green
bakylw="\[\e[43m\]"   # Yellow
bakblu="\[\e[44m\]"   # Blue
bakpur="\[\e[45m\]"   # Purple
bakcyn="\[\e[46m\]"   # Cyan
bakwht="\[\e[47m\]"   # White
txtrst="\[\e[0m\]"    # Text Reset

### PROMPT ###
export GIT_PS1_SHOWDIRTYSTATE="1"
export GIT_PS1_SHOWCOLORHINTS="1"
# user@host: curdir (gitbranch) [rubyver]
PS1="$txtgrn\u@\h: $txtblu\W$txtylw\$(__git_ps1)$txtred\$(__rbenv_ps1)$txtcyn\$$txtrst "

if [ -r "$HOME/.bashrc" ] ; then
  source "$HOME/.bashrc"
fi
