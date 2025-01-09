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
alias sizeof='du --human-readable --summarize'

function rgf {
  rg --files "${@:2}" | rg "$1"
}

# Exports
export EDITOR="nvim"
export PATH="${HOME}/bin:${PATH}:${HOME}/.local/bin"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export ERL_AFLAGS="-kernel shell_history enabled"
export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_BAT="true" # Use bat in Homebrew
export XDG_CONFIG_HOME="${HOME}/.config"

if hash tty 2>/dev/null; then
  GPG_TTY=$(tty)
  export GPG_TTY
fi

if [[ -n "${ZSH_VERSION-}" ]]; then
  export SHELL_NAME="zsh"
elif [[ -n "${BASH_VERSION-}" ]]; then
  export SHELL_NAME="bash"
else
  export SHELL_NAME="${SHELL##*/}"
fi

# Source all shell files
# shellcheck source=/dev/null
for f in ~/.bash_profile.d/*; do [ -f "$f" ] && source "$f"; done
