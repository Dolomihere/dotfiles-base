#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WALL_PAPER="$("${SCRIPT_DIR}/get_image.sh")"

pipewire &

waybar &

swaybg -i "${WALL_PAPER}" -m fill &

swayidle -w \
  timeout 480 "swaylock -f -i ${WALL_PAPER}" \
  timeout 900 "niri msg action power-off-monitors" \
  timeout 1500 "loginctl suspend" \
  before-sleep "swaylock -f -i ${WALL_PAPER}" &
