#!/usr/bin/env bash

shopt -s nullglob
files=( ~/Pictures/*.{png,jpg,jpeg,webp} )

if [ ${#files[@]} -eq 0 ]; then
    [[ -f ~/Pictures/not-available.png ]] && exec swaybg -m fill -i ~/Pictures/not-available.png
    exit 1
fi

IMG="${files[RANDOM % ${#files[@]}]}"

exec swaybg -m fill -i "${IMG}"

