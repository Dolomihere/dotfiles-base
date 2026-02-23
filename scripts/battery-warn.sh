#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BAT0"
LAST_NOTIFIED=100
LOW=20; CRIT=10; DANG=5 

[[ -d "${BAT_PATH}" ]] || exit 1

while true; do
    read -r LEVEL < "${BAT_PATH}/capacity"
    read -r STATUS < "${BAT_PATH}/status"

    if [[ "${STATUS}" == "Discharging" ]]; then
        if [[ "${LEVEL}" -le "${DANG}" && "${LAST_NOTIFIED}" -gt "${DANG}" ]]; then
            notify-send -u critical -a "AlertBat" "BATTERY DYING: ${LEVEL}%" "Plug in NOW!"
            LAST_NOTIFIED=$DANG
        elif [[ "${LEVEL}" -le "${CRIT}" && "${LAST_NOTIFIED}" -gt "${CRIT}" ]]; then
            notify-send -u critical -a "AlertBat" "Battery Critical: ${LEVEL}%" "Save your work."
            LAST_NOTIFIED=${CRIT}
        elif [[ "${LEVEL}" -le "${LOW}" && "${LAST_NOTIFIED}" -gt "${LOW}" ]]; then
            notify-send -u normal -a "AlertBat" "Battery Low: ${LEVEL}%" "Find a charger."
            LAST_NOTIFIED=${LOW}
        fi
    else
        LAST_NOTIFIED=100
    fi

    sleep 60
done

