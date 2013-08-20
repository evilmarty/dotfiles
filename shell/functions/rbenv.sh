__rbenv_ps1 ()
{
  local b="$(rbenv version-name)";
  if [ -n "$b" ]; then
    printf " [%s]" "$b"
  fi
}
