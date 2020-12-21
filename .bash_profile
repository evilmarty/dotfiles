#!/usr/bin/env sh

# Aliases
alias cat='bat'
alias ll='ls --color=auto -GFlash'
alias rtest='ruby -Itest'
alias tree='tree -C'
alias tunnel='ssh -D 1080 -N -T'
alias sssh='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"'
alias stop-ssh='ssh -O stop'
alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias gitl='git log'
alias gits='git status'
alias gitc='git commit'
alias gitp='git pull'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle open'
alias docker-clean='docker images --quiet --filter "dangling=true" | xargs docker rmi'
alias dc='docker-compose'

# Exports
export EDITOR="nvim"
export PATH="~/bin:/usr/local/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export GPG_TTY=$(tty)

# Source all shell files
for f in ~/.bash_profile.d/*; do [ -f "$f" ] && source $f; done
