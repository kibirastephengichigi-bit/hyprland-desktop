# Keybindings Reference

## Application Launchers
| Key Binding | Action |
|---|---|
| `Super + Q` | Open Kitty terminal |
| `Super + D` | Open application launcher (Rofi) |
| `Super + E` | Open file manager |

## Window Management
| Key Binding | Action |
|---|---|
| `Super + C` | Close window |
| `Super + V` | Toggle floating |
| `Super + P` | Toggle pseudo-tiling |
| `Super + F` | Fullscreen |

## Navigation
| Key Binding | Action |
|---|---|
| `Super + ←` | Focus left |
| `Super + →` | Focus right |
| `Super + ↑` | Focus up |
| `Super + ↓` | Focus down |

## Workspaces
| Key Binding | Action |
|---|---|
| `Super + 1-0` | Switch to workspace 1-10 |
| `Super + Shift + 1-0` | Move window to workspace 1-10 |

## Special Functions
| Key Binding | Action |
|---|---|
| `PrintScreen` | Take screenshot |
| `Volume Up` | Increase volume |
| `Volume Down` | Decrease volume |
| `Mute` | Toggle mute |
| `Brightness Up` | Increase brightness |
| `Brightness Down` | Decrease brightness |

## Customization

To modify these keybindings, edit `~/.config/hypr/keybinds.conf`.

Example:
```conf
$mainMod = SUPER

bind = $mainMod, Q, exec, kitty
bind = $mainMod, Return, exec, nautilus
```

For a complete list of keys, see: https://wiki.hyprland.org/Configuring/Binds/
