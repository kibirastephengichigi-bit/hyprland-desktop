# Installation Guide

## Prerequisites

Before installing Hyprverse, ensure you have the following packages installed:

### Required
- `hyprland` - Tiling window manager
- `waybar` - Status bar
- `kitty` - Terminal emulator
- `rofi` - Application launcher
- `dunst` - Notification daemon
- `wlogout` - Logout menu
- `swaync` - Notification center
- `swww` - Wallpaper daemon

### Optional but Recommended
- `fastfetch` - System information
- `cava` - Audio visualizer
- `grim` - Screenshot tool
- `wl-clipboard` - Clipboard manager
- `pamixer` - Audio mixer
- `brightnessctl` - Brightness control
- `swaylock` - Lockscreen

## Installation Steps

1. Clone or download this repository:
```bash
git clone https://github.com/your-username/hyprverse.git
cd hyprverse
```

2. Make the installation script executable:
```bash
chmod +x install.sh
```

3. Run the installer:
```bash
./install.sh
```

4. Log out and back in, or restart your display server to apply changes.

## Post-Installation

### Configure Monitors
Edit `~/.config/hypr/monitors.conf` to set up your displays:
```conf
monitor = DP-1,1920x1080@60,0x0,1
monitor = HDMI-1,1920x1080@60,1920x0,1
```

### Customize Keybindings
Edit `~/.config/hypr/keybinds.conf` to modify your shortcuts.

### Set Wallpaper
Place your wallpapers in `~/.config/hypr/assets/wallpapers/` and run:
```bash
~/.config/hypr/scripts/wallpaper.sh your-wallpaper.png
```

## Uninstallation

To remove Hyprverse:
```bash
chmod +x uninstall.sh
./uninstall.sh
```

Backups of your configurations will be saved to `~/.hyprverse_backup_*`.
