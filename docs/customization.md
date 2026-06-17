# Customization Guide

## Color Scheme

The default theme uses **Catppuccin Mocha**. To change colors:

1. Edit configuration files (e.g., `~/.config/hypr/decorations.conf`)
2. Update the color variables in:
   - Hyprland: `col.active_border`, `col.inactive_border`
   - Waybar: CSS color properties
   - Kitty: Color definitions
   - Rofi: Theme file

## Fonts

Change the default font by editing:
- **Kitty**: `font_family` in `~/.config/kitty/kitty.conf`
- **Waybar**: `font-family` in `~/.config/waybar/style.css`
- **Dunst**: `font` in `~/.config/dunst/dunstrc`
- **GTK**: `gtk-font-name` in `~/.config/gtk-3.0/settings.ini`

## Wallpapers

1. Place wallpapers in `~/.config/hypr/assets/wallpapers/`
2. Set a wallpaper: `~/.config/hypr/scripts/wallpaper.sh your-wallpaper.png`
3. Or set randomly: `~/.config/hypr/scripts/wallpaper.sh`

## Keybindings

Edit `~/.config/hypr/keybinds.conf` to customize shortcuts. Key format:
```conf
bind = $mainMod SHIFT, Return, exec, kitty
```

## Animation Timing

Modify animation speed in `~/.config/hypr/animations.conf`:
```conf
animation = windows, 1, 7, myBezier  # Change '7' for faster/slower
```

Lower values = faster animations

## Bar Position

Change Waybar position in `~/.config/waybar/config.jsonc`:
```json
"position": "top"    // or "bottom", "left", "right"
```

## Gaps and Borders

Adjust in `~/.config/hypr/decorations.conf`:
```conf
gaps_in = 8      # Gaps between windows
gaps_out = 12    # Gaps from screen edges
border_size = 2  # Window border thickness
```
