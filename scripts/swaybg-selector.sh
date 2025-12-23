#!/usr/bin/env bash

WALL_DIR="${HOME}/Pictures"

cd "${WALL_DIR}" || exit

files=()
for f in *; do
  if [ -f "${f}" ]; then
      files+=("${f}")
  fi
done

PS3=$'\nSelect a number for your wallpaper: '

select img in "${files[@]}"; do
  if [ -n "${img}" ] && [ -f "${img}" ]; then

    old_bg_pids=$(pgrep -x swaybg)
    setsid swaybg -m fill -i "${WALL_DIR}/${img}" > /dev/null 2>&1 &
    new_pid=$!

    sleep 0.1

    for pid in ${old_bg_pids}; do
      [ "${pid}" != "${new_pid}" ] && kill "${pid}"
    done

    notify-send "Applying wallpaper ${img%.*} ..."
    break

  else
    printf '\033[2A\033[J'
    PS3=$'\nInvalid selection choice. Please select a number: '
  fi
done

