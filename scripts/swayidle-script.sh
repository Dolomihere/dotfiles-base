#!/usr/bin/env bash

DIR="${HOME}/Pictures"
FALLBACK="${DIR}/not-available.png"

IMAGES=$(find "$DIR" -maxdepth 1 -type f \( -iname "lock*.png" -o -iname "lock*.jpg" -o -iname "lock*.jpeg" \))

if [ -z "$IMAGES" ]; then
  if [ -f "$FALLBACK" ]; then
    IMG="${FALLBACK}"
  else
    exit 1
  fi
else
  IMG=$(echo "${IMAGES}" | shuf -n 1)
fi

swayidle -w \
  timeout 600 "niri msg action power-off-monitors" \
  timeout 480 "swaylock -f -i ${IMG}" \
  before-sleep "swaylock -f" \
  timeout 1500 "loginctl suspend"

