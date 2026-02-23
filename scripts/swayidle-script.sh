#!/usr/bin/env bash

shopt -s nullglob
IMAGES=( ~/Pictures/lock*.{png,jpg,jpeg} )

if [ ${#IMAGES[@]} -eq 0 ]; then
    IMG="${HOME}/Pictures/not-available.png"
    [ -f "${IMG}" ] || exit 1
else
    IMG="${IMAGES[RANDOM % ${#IMAGES[@]}]}"
fi

exec swayidle -w \
  timeout 600 "niri msg action power-off-monitors" \
  timeout 480 "swaylock -f -i ${IMG}" \
  before-sleep "swaylock -f" \
  timeout 1500 "loginctl suspend"

