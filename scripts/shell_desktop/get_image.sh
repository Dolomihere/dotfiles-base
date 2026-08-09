#!/usr/bin/env bash

WALL_DIR="${HOME}/Pictures"
EXTENSIONS=(-name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.webp')
IMG_PATH=$(find "${WALL_DIR}" -maxdepth 1 -type f \( "${EXTENSIONS[@]}" \) | shuf -n 1)

if [[ -z "${IMG_PATH}" ]]; then
  notify-send -u low \
    "Script Error" \
    "No images found in ${WALL_DIR}"
  exit 1
fi

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "${IMG_PATH}"
fi
