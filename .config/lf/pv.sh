#!/bin/sh
set -e

args=(--color always --pager newer)

case "${#@}" in
  3)
    args+=(--line-range ":${3}" --terminal-width "$2")
    ;;
  2)
    args+=(--terminal-width "$2")
    ;;
  1)
    ;;
  0)
    exit 1
    ;;
  *)
    y2=$(($4 + $3))
    args+=(--line-range "${4}:${y2}" --terminal-width "$2")
    ;;
esac

bat "${args[@]}" "$1"
