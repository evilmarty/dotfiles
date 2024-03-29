#!/usr/bin/env sh

# Aliases
alias cat='bat'
alias ls='eza --git'
alias ll='eza -la --git'
alias tree='tree -C'
alias ssh-stop='ssh -O stop'
alias sssh='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"'
alias nv='nvim'
alias vim='nvim'
alias gitl='git log'
alias gits='git status'
alias gitc='git commit'
alias gitp='git pull'
alias dc='docker-compose'
alias git-home='cd $(git rev-parse --show-toplevel)'
alias cpv='rsync -ah --info=progress2'

function rgf {
  rg --files ${@:2} | rg $1
}

# Exports
export EDITOR="nvim"
export PATH="~/bin:$PATH:~/.local/bin"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export ERL_AFLAGS="-kernel shell_history enabled"
export GPG_TTY=$(tty)

# Source all shell files
for f in ~/.bash_profile.d/*; do [ -f "$f" ] && source $f; done
