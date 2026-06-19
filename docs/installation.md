# Installation

This installer targets Arch Linux or Arch-based systems.

## Barebones Arch Checklist

Before running the installer, make sure you have:

- A working internet connection
- A user with `sudo` access
- `git` installed
- Optional: `yay` or `paru` for AUR packages such as `quickshell`

## Install

```bash
sudo pacman -S --needed git
git clone https://github.com/kibirastephengichigi-bit/hyprland-desktop.git
cd hyprland-desktop
./install.sh
```

The script installs required packages, copies configs to `~/.config`, copies wallpapers to `~/Pictures/wallpapers`, prepares the current wallpaper, and enables common services.

## After Install

Reboot or log out, then start Hyprland. Use `Super+Shift+E` for the codecrafter settings menu.
