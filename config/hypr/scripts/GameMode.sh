#!/usr/bin/env bash
# /* ---- 💫 Min Developer: Stephen Kibira | Codename: codecrafter 💫 ---- */  ##
# Game Mode. Turning off all animations

notif="$HOME/.config/swaync/images/ja.png"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

if command -v swww >/dev/null 2>&1 && command -v swww-daemon >/dev/null 2>&1; then
    wallpaper_cmd="swww"
    daemon_cmd="swww-daemon"
    daemon_format="xrgb"
elif command -v awww >/dev/null 2>&1 && command -v awww-daemon >/dev/null 2>&1; then
    wallpaper_cmd="awww"
    daemon_cmd="awww-daemon"
    daemon_format="rgb"
else
    wallpaper_cmd=""
fi

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
	
	hyprctl keyword "windowrule opacity 1 override 1 override 1 override, ^(.*)$"
    [ -n "$wallpaper_cmd" ] && "$wallpaper_cmd" kill
    notify-send -e -u low -i "$notif" " Gamemode:" " enabled"
    sleep 0.1
    exit
else
	[ -n "$wallpaper_cmd" ] && "$SCRIPTSDIR/ApplyWallpaper.sh" "$HOME/.config/rofi/.current_wallpaper" &
	sleep 0.1
	${SCRIPTSDIR}/WallustSwww.sh
	sleep 0.5
  hyprctl reload
	${SCRIPTSDIR}/Refresh.sh	 
    notify-send -e -u normal -i "$notif" " Gamemode:" " disabled"
    exit
fi
hyprctl reload
