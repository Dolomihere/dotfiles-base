#!/usr/bin/env bash

SAVE_DIR="${HOME}/Videos/Recordings"
mkdir -p "${SAVE_DIR}"
FILE_NAME="${SAVE_DIR}/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"

REGION=$(slurp -f %wx%h+%x+%y)
if [ -z "${REGION}" ]; then
  exit 1
fi

AUDIO_SRC="$(pactl get-default-sink).monitor"

gpu-screen-recorder -w "${REGION}" -a "${AUDIO_SRC}" -f 60 -o "${FILE_NAME}" 

