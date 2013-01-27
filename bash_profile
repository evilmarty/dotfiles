#!/usr/bin/env sh

DOTFILES_DIR=$HOME/.dotfiles

export EDITOR="subl"

alias ll='ls -l'
# Git aliases
alias gitl='git log'
alias gits='git status'
alias gitc='git commit'
alias gitp='git pull'
alias git-prune-merged-branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
# Bundler aliases
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle open'

alias rtest='ruby -Itest'

eval "$(hub alias -s bash)"

export PATH="$HOME/.bin:$HOME/.rbenv/bin:$PATH:$HOME/node_modules/.bin"
eval "$(rbenv init -)"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

for file in $DOTFILES_DIR/*.bash
do
  . $file
done

__git_ps1 () 
{ 
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}

__rbenv_ps1 ()
{
  local b="$(rbenv version-name)";
  if [ -n "$b" ]; then
    printf " [%s]" "$b"
  fi
}

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
# user@host: curdir (gitbranch) [rubyver]
PS1="$txtgrn\u@\h: $txtblu\W$txtylw\$(__git_ps1)$txtred\$(__rbenv_ps1)$txtcyn\$$txtrst "

if [ -r "$HOME/.bashrc" ] ; then
  source "$HOME/.bashrc"
fi
