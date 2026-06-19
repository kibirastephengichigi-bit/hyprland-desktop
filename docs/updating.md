# Updating

Run updates from inside the cloned repository:

```bash
cd hyprland-desktop
./update.sh
```

The updater creates a timestamped backup, pulls the latest Git changes, reapplies `config/`, syncs wallpapers, and reloads Hyprland/Waybar when possible.

Backups are stored in:

```text
~/.local/state/codecrafter-hyprland/backups
```
