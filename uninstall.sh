#!/bin/bash

# Hyprverse Uninstallation Script
# This script removes the Hyprverse desktop configuration

set -e

CONFIG_DIR="$HOME/.config"

echo "🗑️  Starting Hyprverse uninstallation..."

# Backup configurations before removal
BACKUP_DIR="$HOME/.hyprverse_backup_$(date +%s)"
mkdir -p "$BACKUP_DIR"

echo "💾 Backing up configurations to $BACKUP_DIR..."
cp -r "$CONFIG_DIR/hypr" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/waybar" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/kitty" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/rofi" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/dunst" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/wlogout" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/swaync" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/fastfetch" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/cava" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$CONFIG_DIR/gtk-3.0" "$BACKUP_DIR/" 2>/dev/null || true

echo "🗑️  Removing Hyprverse configurations..."
rm -rf "$CONFIG_DIR/hypr"
rm -rf "$CONFIG_DIR/waybar"
rm -rf "$CONFIG_DIR/kitty"
rm -rf "$CONFIG_DIR/rofi"
rm -rf "$CONFIG_DIR/dunst"
rm -rf "$CONFIG_DIR/wlogout"
rm -rf "$CONFIG_DIR/swaync"
rm -rf "$CONFIG_DIR/fastfetch"
rm -rf "$CONFIG_DIR/cava"
rm -rf "$CONFIG_DIR/gtk-3.0"

echo "✅ Uninstallation complete!"
echo "📦 Backups saved to: $BACKUP_DIR"
