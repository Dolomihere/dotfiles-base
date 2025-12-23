#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BAT0"
LOW=20
CRIT=10
DANG=5

last_notified=100 

while true; do
  if [ -d "$BAT_PATH" ]; then

    LEVEL=$(cat "$BAT_PATH/capacity")
    STATUS=$(cat "$BAT_PATH/status")

    if [ "$STATUS" = "Discharging" ]; then

      if [ "$LEVEL" -le "$DANG" ] && [ "$last_notified" -gt "$DANG" ]; then
        notify-send -u critical -a "AlertBat" "BATTERY DYING: $LEVEL%" "Plug in NOW!"
        last_notified=$DANG

      elif [ "$LEVEL" -le "$CRIT" ] && [ "$last_notified" -gt "$CRIT" ]; then
        notify-send -u critical -a "AlertBat" "Battery Critical: $LEVEL%" "Save your work."
        last_notified=$CRIT

      elif [ "$LEVEL" -le "$LOW" ] && [ "$last_notified" -gt "$LOW" ]; then
        notify-send -u normal -a "AlertBat" "Battery Low: $LEVEL%" "Find a charger."
        last_notified=$LOW
      fi

    else
      last_notified=100
    fi
  fi

  sleep 60
done

