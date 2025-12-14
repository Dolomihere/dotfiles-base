#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <image-file>"
    exit 1
fi

FILE="$1"

SYMBOLS=(
    all ascii braille extra imported narrow solid ugly
    alnum bad diagonal geometric inverted none space vhalf
    alpha block digit half latin quad stipple wedge
    ambiguous border dot hhalf legacy sextant technical wide
)

clear

for sym in "${SYMBOLS[@]}"; do
    echo
    echo "========== chafa --symbols $sym =========="
    echo

    chafa --format symbols --size=60x17 --symbols "$sym" "$FILE"

    echo
    echo "[Press ENTER for next symbol set, or q to quit]"
    read -r -s -n1 key

    [[ "$key" == "q" ]] && exit 0
    clear
done

