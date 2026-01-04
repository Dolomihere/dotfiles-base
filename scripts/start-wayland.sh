#!/usr/bin/env bash

SH_DIR=${HOME}/.config/scripts

waybar &

"${SH_DIR}"/swaybg-script.sh &

"${SH_DIR}"/swayidle-script.sh &

fcitx5 -d &

