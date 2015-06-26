if [ -f "$(which rbenv)" ]; then
  export RBENV_ROOT=$(rbenv root)
  if [ -d $RBENV_ROOT ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
  fi
fi
