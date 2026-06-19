#!/usr/bin/env bash
set -euo pipefail

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/codecrafter-hyprland"
latest_backup="$(find "$STATE_DIR/backups" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort | tail -n 1 || true)"

if [ -z "$latest_backup" ]; then
  echo "No codecrafter backup found under $STATE_DIR/backups" >&2
  exit 1
fi

printf "Restore backup %s? [y/N] " "$latest_backup"
read -r answer
case "$answer" in
  y|Y|yes|YES) ;;
  *) echo "Cancelled."; exit 0 ;;
esac

if [ -d "$latest_backup/.config" ]; then
  cp -a "$latest_backup/.config/." "$HOME/.config/"
fi

echo "Restored latest backup. Log out and back in if Hyprland is running."
