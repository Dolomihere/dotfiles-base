#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BAT0"
LOW=20
CRIT=10
DANG=5

last_notified=0

while true; do
    if [ -d "$BAT_PATH" ]; then

        LEVEL=$(cat "$BAT_PATH/capacity")
        STATUS=$(cat "$BAT_PATH/status")

        if [ "$STATUS" = "Discharging" ]; then

            if [ "$LEVEL" -le "$DANG" ] && [ "$last_notified" -ne "$DANG" ]; then
                notify-send -u critical "BATTERY DYING: $LEVEL%" "Plug in NOW or system will die."
                last_notified=$DANG

            elif [ "$LEVEL" -le "$CRIT" ] && [ "$LEVEL" -gt "$DANG" ] && [ "$last_notified" -ne "$CRIT" ]; then
                notify-send -u critical "Battery Critical: $LEVEL%" "Save your work immediately."
                last_notified=$CRIT

            elif [ "$LEVEL" -le "$LOW" ] && [ "$LEVEL" -gt "$CRIT" ] && [ "$last_notified" -ne "$LOW" ]; then
                notify-send -u normal "Battery Low: $LEVEL%" "Think about finding a charger."
                last_notified=$LOW
            fi

        else
            last_notified=0
        fi
    fi

    sleep 180
done

