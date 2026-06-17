#!/bin/bash

# Volume control script for Hyprland

case "$1" in
    up)
        pamixer -i 5
        ;;
    down)
        pamixer -d 5
        ;;
    toggle)
        pamixer -t
        ;;
    *)
        echo "Usage: $0 {up|down|toggle}"
        exit 1
        ;;
esac

# Get current volume
VOLUME=$(pamixer --get-volume)
echo "Volume: $VOLUME%"
