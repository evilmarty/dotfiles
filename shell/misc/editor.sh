if hash nvim 2>/dev/null; then
  export EDITOR='nvim'
  alias vim='nvim'
  alias vi='nvim'
else
  export EDITOR='vim'
fi