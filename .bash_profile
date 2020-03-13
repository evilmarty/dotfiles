#!/usr/bin/env sh

# Aliases
alias cat='bat'
alias ll='ls -GFlash'
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
alias edh-prod='aws-vault exec production --'
alias edh-prod1='aws-vault exec --assume-role-ttl=1h production --'
alias edh-prod2='aws-vault exec --assume-role-ttl=2h production --'
alias edh-stag='aws-vault exec staging --'
alias edh-stag1='aws-vault --assume-role-ttl=1h exec staging --'
alias edh-stag2='aws-vault --assume-role-ttl=2h exec staging --'
alias edh-build='aws-vault exec build --'
alias edh-build1='aws-vault exec --assume-role-ttl=1h build --'
alias edh-build2='aws-vault exec --assume-role-ttl=2h build --'
alias prod='aws-vault exec production --'
alias prod1='aws-vault exec --assume-role-ttl=1h production --'
alias stag='aws-vault exec staging --'
alias stag1='aws-vault exec --assume-role-ttl=1h staging --'
alias ec2-run='aws-vault exec --assume-role-ttl=1h build -- ~/bin/ec2-run'
alias packer='aws-vault exec --assume-role-ttl=1h build -- /usr/local/bin/packer'

# Exports
export EDITOR="nvim"
export PATH="~/bin:/usr/local/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Source all shell files
for f in ~/.bash_profile.d/*; do [ -f "$f" ] && source $f; done
