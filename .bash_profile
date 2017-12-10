#!/usr/bin/env sh

# Source all shell files
for f in ~/.bash_profile.d/*; do [ -f "$f" ] && source $f; done

BASH_LOCAL_FILE=~/.bash_local
[ -f "$BASH_LOCAL_FILE" ] && source "$BASH_LOCAL_FILE"
