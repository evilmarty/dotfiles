rbenv=$(which rbenv)
__rbenv_ps1 ()
{
  if [ -n "$rbenv" ]; then
    local b="$($rbenv version-name)";
    if [ -n "$b" ]; then
      printf " [%s]" "$b"
    fi
  fi
}
