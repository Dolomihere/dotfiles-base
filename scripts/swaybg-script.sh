#!/usr/bin/env bash

DIR="${HOME}/Pictures"
FALLBACK="${DIR}/not-available.png"

IMAGES=$(find "$DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) ! -iname 'not-available.png')

if [ -z "$IMAGES" ]; then
  if [ -f "$FALLBACK" ]; then
    IMG="${FALLBACK}"
  else
    exit 1
  fi
else
  IMG=$(echo "${IMAGES}" | shuf -n 1)
fi

swaybg -m fill -i "${IMG}"

