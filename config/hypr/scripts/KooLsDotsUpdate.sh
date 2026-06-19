#!/usr/bin/env bash
# /* ---- Min Developer: Stephen Kibira | Codename: codecrafter ---- */  ##
# Update helper for the installed codecrafter Hyprland desktop.

set -euo pipefail

repo_dir="${CODECRAFTER_HYPRLAND_REPO:-$HOME/Documents/hyprland-desktop}"
iDIR="$HOME/.config/swaync/images"

notify_user() {
  notify-send -i "$iDIR/note.png" "codecrafter updates" "$1" 2>/dev/null || printf "%s\n" "$1"
}

if [ ! -d "$repo_dir/.git" ]; then
  notify_user "Repository not found at $repo_dir. Clone hyprland-desktop there first."
  exit 1
fi

if [ ! -x "$repo_dir/update.sh" ]; then
  notify_user "update.sh is missing or not executable in $repo_dir."
  exit 1
fi

if command -v kitty >/dev/null 2>&1; then
  kitty -e bash -lc "cd \"$repo_dir\" && ./update.sh; read -rp \"Press Enter to close...\"" &
else
  cd "$repo_dir"
  ./update.sh
fi
