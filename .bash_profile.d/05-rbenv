if hash rbenv 2>/dev/null; then
  export RBENV_ROOT=`rbenv root`
  if [ -d "$RBENV_ROOT" ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
  fi
fi
