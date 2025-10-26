#!/usr/bin/env bash

swayidle -w \
  timeout 600 'niri msg action power-off-monitors' \
  timeout 480 'swaylock -f' \
  before-sleep 'swaylock -f' \
  timeout 1500 'systemctl suspend'

