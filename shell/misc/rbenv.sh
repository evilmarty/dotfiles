if [ command -v rbenv >/dev/null 2>&1 ]; then
  export RBENV_ROOT=`rbenv root`
  if [ -d "$RBENV_ROOT" ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval `rbenv init -`
  fi
fi
