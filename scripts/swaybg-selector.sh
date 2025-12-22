#!/usr/bin/env bash

WALL_DIR="${HOME}/Pictures"

cd "${WALL_DIR}" || exit

files=()
for f in *; do
    if [ -f "$f" ]; then
        files+=("$f")
    fi
done

echo "Select a number for your wallpaper:"

select img in "${files[@]}"; do
    if [ -n "${img}" ] && [ -f "$img" ]; then
        pkill swaybg
        setsid swaybg -m fill -i "${WALL_DIR}/${img}" > /dev/null 2>&1 &
        notify-send "Wallpaper Changed"
        sleep 0.1
        break
    else
        echo "Invalid file selection. Please try again."
    fi
done

