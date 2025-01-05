try_source() {
  [[ -r "$1" ]] && source "$1"
}

if type brew &>/dev/null; then
  BREW_PREFIX=$(brew --prefix)
  FPATH="${BREW_PREFIX}/share/zsh-completions:${FPATH}"

  try_source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  try_source "${BREW_PREFIX}/share/zsh-autopair/autopair.zsh"
  try_source "${BREW_PREFIX}/share/zsh-system-clipboard/zsh-system-clipboard.zsh"
  try_source "${BREW_PREFIX}/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
  try_source "${BREW_PREFIX}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

  # Don't load compinit if loading zsh-autocomplete
  # autoload -Uz compinit
  # compinit
fi

source ~/.bash_profile
