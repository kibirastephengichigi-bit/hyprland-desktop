#!/usr/bin/env bash
# Apply the saved static wallpaper on Hyprland startup.

set -u

wallpaper="${1:-$HOME/.config/hypr/wallpaper_effects/.wallpaper_current}"
iDIR="$HOME/.config/swaync/images"

if command -v swww >/dev/null 2>&1 && command -v swww-daemon >/dev/null 2>&1; then
  wallpaper_cmd="swww"
  daemon_cmd="swww-daemon"
  daemon_format="xrgb"
elif command -v awww >/dev/null 2>&1 && command -v awww-daemon >/dev/null 2>&1; then
  wallpaper_cmd="awww"
  daemon_cmd="awww-daemon"
  daemon_format=""
else
  notify-send -i "$iDIR/error.png" "Wallpaper" "Install swww or awww first" 2>/dev/null || true
  exit 127
fi

if [[ ! -f "$wallpaper" ]]; then
  notify-send -i "$iDIR/error.png" "Wallpaper" "Saved wallpaper not found: $wallpaper" 2>/dev/null || true
  exit 1
fi

if ! "$wallpaper_cmd" query >/dev/null 2>&1; then
  if [[ -n "$daemon_format" ]]; then
    "$daemon_cmd" --format "$daemon_format" >/dev/null 2>&1 &
  else
    "$daemon_cmd" >/dev/null 2>&1 &
  fi
  for _ in {1..20}; do
    "$wallpaper_cmd" query >/dev/null 2>&1 && break
    sleep 0.1
  done
fi

"$wallpaper_cmd" img "$wallpaper" \
  --transition-fps 30 \
  --transition-type fade \
  --transition-duration 1
