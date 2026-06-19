#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/codecrafter-hyprland"
BACKUP_DIR="$STATE_DIR/backups/$(date +%Y%m%d-%H%M%S)"
PACMAN_PACKAGES=(
  hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
  waybar rofi-wayland kitty ghostty swaync wlogout hyprlock hypridle
  awww wallust imagemagick ffmpeg jq bc cliphist wl-clipboard
  grim slurp swappy playerctl brightnessctl pamixer pavucontrol
  network-manager-applet blueman thunar fastfetch cava qt5ct qt6ct
  noto-fonts noto-fonts-emoji ttf-jetbrains-mono-nerd
)
AUR_PACKAGES=(
  quickshell
)

log() { printf "\033[1;34m==>\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33mwarning:\033[0m %s\n" "$*"; }

need_arch() {
  if ! command -v pacman >/dev/null 2>&1; then
    echo "This installer expects Arch Linux or an Arch-based distro with pacman." >&2
    exit 1
  fi
}

install_pacman_packages() {
  log "Installing desktop packages"
  sudo pacman -Syu --needed "${PACMAN_PACKAGES[@]}"
}

install_aur_packages() {
  if command -v yay >/dev/null 2>&1; then
    yay -S --needed "${AUR_PACKAGES[@]}"
  elif command -v paru >/dev/null 2>&1; then
    paru -S --needed "${AUR_PACKAGES[@]}"
  else
    warn "No yay/paru found; skipping AUR packages: ${AUR_PACKAGES[*]}"
    warn "Install quickshell manually if the overview shell does not launch."
  fi
}

backup_path() {
  local target="$1"
  if [ -e "$target" ] || [ -L "$target" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${target#$HOME/}")"
    cp -a "$target" "$BACKUP_DIR/${target#$HOME/}"
  fi
}

copy_config() {
  log "Installing configuration files"
  mkdir -p "$HOME/.config" "$HOME/Pictures"
  for item in "$REPO_DIR"/config/*; do
    [ -e "$item" ] || continue
    name="$(basename "$item")"
    backup_path "$HOME/.config/$name"
    rm -rf "$HOME/.config/$name"
    cp -a "$item" "$HOME/.config/$name"
  done
}

copy_assets() {
  log "Installing wallpaper assets"
  mkdir -p "$HOME/Pictures/wallpapers"
  if [ -d "$REPO_DIR/assets/wallpapers" ]; then
    cp -a "$REPO_DIR/assets/wallpapers/." "$HOME/Pictures/wallpapers/"
  fi
}

prepare_wallpaper() {
  local wallpaper="$HOME/Pictures/wallpapers/Abstract - Nature.jpg"
  if [ ! -f "$wallpaper" ]; then
    wallpaper="$(find "$HOME/Pictures/wallpapers" -maxdepth 1 -type f | head -n 1 || true)"
  fi
  if [ -n "${wallpaper:-}" ] && [ -f "$wallpaper" ]; then
    mkdir -p "$HOME/.config/hypr/wallpaper_effects" "$HOME/.config/rofi"
    cp -f "$wallpaper" "$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
    ln -sf "$wallpaper" "$HOME/.config/rofi/.current_wallpaper"
    if command -v wallust >/dev/null 2>&1; then
      wallust run -s "$wallpaper" || true
    fi
  fi
}

enable_services() {
  log "Enabling NetworkManager and bluetooth when available"
  sudo systemctl enable --now NetworkManager.service || true
  sudo systemctl enable --now bluetooth.service || true
}

print_done() {
  cat <<MSG

codecrafter Hyprland installed.
Backup: $BACKUP_DIR

Next steps:
1. Reboot or log out.
2. Start a Hyprland session.
3. Press Super+Shift+E for codecrafter quick settings.

MSG
}

main() {
  need_arch
  install_pacman_packages
  install_aur_packages
  copy_config
  copy_assets
  prepare_wallpaper
  enable_services
  print_done
}

main "$@"
