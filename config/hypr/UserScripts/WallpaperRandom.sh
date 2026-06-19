#!/usr/bin/env bash
# /* ---- 💫 Min Developer: Stephen Kibira | Codename: codecrafter 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

PICTURES_DIR="$(xdg-user-dir PICTURES 2>/dev/null || echo "$HOME/Pictures")"
wallDIR="$PICTURES_DIR/wallpapers"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
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

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

mapfile -d '' PICS < <(find -L "${wallDIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.pnm" -o -iname "*.tga" -o -iname "*.tiff" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.farbfeld" -o -iname "*.gif" \) -print0)

if (( ${#PICS[@]} == 0 )); then
  notify-send -i "$iDIR/error.png" "Wallpaper" "No images found in $wallDIR" 2>/dev/null || true
  exit 1
fi

RANDOMPICS=${PICS[$((RANDOM % ${#PICS[@]}))]}


# Transition config
FPS=30
TYPE="random"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"


if ! "$wallpaper_cmd" query >/dev/null 2>&1; then
  if [[ -n "$daemon_format" ]]; then
    "$daemon_cmd" --format "$daemon_format" &
  else
    "$daemon_cmd" &
  fi
  sleep 0.2
fi
"$wallpaper_cmd" img -o "$focused_monitor" "$RANDOMPICS" $SWWW_PARAMS

wait $!
"$SCRIPTSDIR/WallustSwww.sh" "$RANDOMPICS" &&

wait $!
sleep 2
"$SCRIPTSDIR/Refresh.sh"
