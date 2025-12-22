#!/usr/bin/env bash

WALL_DIR="${HOME}/Pictures"
FALLBACK="${WALL_DIR}/not-available.png"

IMAGES=$(find "$WALL_DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) ! -iname 'not-available.png')

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

