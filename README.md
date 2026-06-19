# hyprland-desktop

Min Developer: Stephen Kibira  
Codename: codecrafter

A complete Arch Linux Hyprland desktop profile packaged from Stephen Kibira's working setup. It installs a usable Wayland desktop with Hyprland, Waybar, Rofi, Kitty, wallpaper theming, notifications, quick settings, and personal codecrafter branding.

## What This Repo Contains

- `config/` - the desktop configuration copied into `~/.config`
- `assets/wallpapers/` - wallpaper collection used by the wallpaper picker and theming scripts
- `install.sh` - turns a bare Arch install into this desktop profile
- `update.sh` - pulls repo updates and reapplies config safely
- `uninstall.sh` - restores backups created by the installer
- `docs/` - installation, update, customization, and keybinding notes

## Quick Install

```bash
git clone https://github.com/kibirastephengichigi-bit/hyprland-desktop.git
cd hyprland-desktop
./install.sh
```

Then reboot or log out and choose Hyprland from your display manager/session launcher.

## Update Existing Install

```bash
cd hyprland-desktop
./update.sh
```

The scripts create timestamped backups under `~/.local/state/codecrafter-hyprland/backups` before replacing config.

## Target System

This repository targets Arch Linux or an Arch-based distro with `pacman`. It can be used on an already running desktop too, but it is designed to bootstrap a barebones Arch install.

## Repository

Development repository: <https://github.com/kibirastephengichigi-bit/hyprland-desktop.git>
