#!/bin/bash

ACTIVE_MONITOR_ID=$(hyprctl activeworkspace -j | jq -r '.monitorID')

JQ_SCRIPT='(.x|tostring) + "," + (.y|tostring) + " " + ((.width/.scale)|tostring) + "x" + ((.height/.scale)|tostring)'

GRIM_GEO=$(\
    hyprctl monitors -j | \
    jq -r '.[] | select(.id == '"$ACTIVE_MONITOR_ID"') | '"$JQ_SCRIPT"''
)

echo $GRIM_GEO

grim -g "$GRIM_GEO" -t png

if [ $? -ne 0 ]; then
    notify-send \
        -a "grim" \
        -t 2000 \
        "ERROR: The screenshot could not be taken"
    exit 1
fi

notify-send \
    -a "grim" \
    -t 2000 \
    "The screenshot had been taken"

