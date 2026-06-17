#!/bin/bash

# Wallpaper script for Hyprland

WALLPAPER_DIR="$HOME/.config/hypr/assets/wallpapers"

if [ -z "$1" ]; then
    # If no argument, pick a random wallpaper
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
else
    WALLPAPER="$WALLPAPER_DIR/$1"
fi

if [ -f "$WALLPAPER" ]; then
    swww img "$WALLPAPER"
    echo "Wallpaper set to: $WALLPAPER"
else
    echo "Wallpaper not found: $WALLPAPER"
    exit 1
fi
