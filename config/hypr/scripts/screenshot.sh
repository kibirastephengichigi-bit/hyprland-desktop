#!/bin/bash

# Screenshot script for Hyprland

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"

grim "$FILENAME"

echo "Screenshot saved to $FILENAME"

# Optional: Copy to clipboard
wl-copy < "$FILENAME"
