#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/codecrafter-hyprland"
BACKUP_DIR="$STATE_DIR/backups/update-$(date +%Y%m%d-%H%M%S)"
REMOTE="origin"
BRANCH="$(git -C "$REPO_DIR" branch --show-current 2>/dev/null || printf development)"

log() { printf "\033[1;34m==>\033[0m %s\n" "$*"; }

backup_path() {
  local target="$1"
  if [ -e "$target" ] || [ -L "$target" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${target#$HOME/}")"
    cp -a "$target" "$BACKUP_DIR/${target#$HOME/}"
  fi
}

backup_current_config() {
  mkdir -p "$BACKUP_DIR"
  for item in "$REPO_DIR"/config/*; do
    [ -e "$item" ] || continue
    backup_path "$HOME/.config/$(basename "$item")"
  done
}

pull_updates() {
  if git -C "$REPO_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    log "Pulling latest repository changes"
    git -C "$REPO_DIR" pull --ff-only "$REMOTE" "$BRANCH"
  fi
}

apply_config() {
  log "Applying updated config"
  for item in "$REPO_DIR"/config/*; do
    [ -e "$item" ] || continue
    name="$(basename "$item")"
    rm -rf "$HOME/.config/$name"
    cp -a "$item" "$HOME/.config/$name"
  done
  mkdir -p "$HOME/Pictures/wallpapers"
  if [ -d "$REPO_DIR/assets/wallpapers" ]; then
    cp -a "$REPO_DIR/assets/wallpapers/." "$HOME/Pictures/wallpapers/"
  fi
}

refresh_session() {
  if command -v hyprctl >/dev/null 2>&1; then
    hyprctl reload >/dev/null 2>&1 || true
  fi
  if command -v waybar-msg >/dev/null 2>&1; then
    waybar-msg cmd reload >/dev/null 2>&1 || true
  fi
}

main() {
  backup_current_config
  pull_updates
  apply_config
  refresh_session
  log "Update complete. Backup: $BACKUP_DIR"
}

main "$@"
