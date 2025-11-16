#!/usr/bin/env bash

# pggrep -x pipewire > /dev/null || pipewire &
# pggrep -x wireplumber > /dev/null || wireplumber &
# pggrep -x pipewire-pulse > /dev/null || pipewire-pulse &

# while [ ! -S /run/user/$(id -u)/pipewire-0 ]; do
#  sleep 0.1
# done

SH_DIR=${HOME}/.scripts

waybar &

${SH_DIR}/swaybg-script.sh &

${SH_DIR}/swayidle-script.sh &

# fcitx5 -d &

