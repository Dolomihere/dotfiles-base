#!/usr/bin/env bash

THRESHOLD_WARN=20; THRESHOLD_LOW=10; THRESHOLD_CRIT=5
LAST_NOTIFIED=100; INTERVAL=120

BAT_PATH=$(find /sys/class/power_supply/BAT*)

while true; do
  if [ -n "${BAT_PATH}" ]; then

    STATUS=$(cat "${BAT_PATH}/status")
    CAPACITY=$(cat "${BAT_PATH}/capacity")
    if [ "${STATUS}" = "Discharging" ]; then

      if [ "${CAPACITY}" -le "${THRESHOLD_CRIT}" ] && [ "${LAST_NOTIFIED}" -gt "${THRESHOLD_CRIT}" ]; then
        LAST_NOTIFIED=${CAPACITY}
        notify-send -u critical \
                    "Battery Crit" \
                    "Battery level is at ${CAPACITY}%. 
                     Give me the goddam charger. You sicko bi***!!"
      fi

      if [ "${CAPACITY}" -le "${THRESHOLD_LOW}" ] && [ "${LAST_NOTIFIED}" -gt "${THRESHOLD_LOW}" ]; then
        LAST_NOTIFIED=${CAPACITY}
        notify-send -u normal \
                    "Battery Low" \
                    "Battery level is at ${CAPACITY}%. Find me a charger. 
                     I am hungry ma'am."
      fi

      if [ "${CAPACITY}" -le "${THRESHOLD_WARN}" ] && [ "${LAST_NOTIFIED}" -gt "${THRESHOLD_WARN}" ]; then
        LAST_NOTIFIED=${CAPACITY}
        notify-send -u normal \
                    "Battery Low" \
                    "Battery level is at ${CAPACITY}%. Remember to plug in the charger.
                     Okay? Yes?"
      fi

    else
      LAST_NOTIFIED=${CAPACITY}
    fi

  fi

  sleep ${INTERVAL}
done
