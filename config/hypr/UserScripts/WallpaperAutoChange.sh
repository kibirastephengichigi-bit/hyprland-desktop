#!/usr/bin/env bash
# /* ---- 💫 Min Developer: Stephen Kibira | Codename: codecrafter 💫 ---- */  ##
# source https://wiki.archlinux.org/title/Hyprland#Using_a_script_to_change_wallpaper_every_X_minutes

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script uses bash (not POSIX shell) for the RANDOM variable

wallust_refresh=$HOME/.config/hypr/scripts/RefreshNoWaybar.sh

if command -v swww >/dev/null 2>&1 && command -v swww-daemon >/dev/null 2>&1; then
	wallpaper_cmd="swww"
elif command -v awww >/dev/null 2>&1 && command -v awww-daemon >/dev/null 2>&1; then
	wallpaper_cmd="awww"
else
	echo "Install swww or awww first"
	exit 127
fi

focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_TYPE=simple

# This controls (in seconds) when to switch to the next image
INTERVAL=1800

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			"$wallpaper_cmd" img -o "$focused_monitor" "$img"
			# Regenerate colors from the exact image path to avoid cache races
			$HOME/.config/hypr/scripts/WallustSwww.sh "$img"
			# Refresh UI components that depend on wallust output
			$wallust_refresh
			sleep $INTERVAL
			
		done
done
