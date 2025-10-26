#!/usr/bin/env bash

IMG="$1"
FALLBACK="${HOME}/Pictures/not-available.png"

if [ -f "${IMG}" ]; then
  swaybg -m fill -i "${IMG}"
else
  swaybg fill -i "${FALLBACK}"
fi

