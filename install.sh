#!/bin/bash

# Hyprverse Installation Script
# This script installs the Hyprverse desktop configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "🚀 Starting Hyprverse installation..."

# Create config directories if they don't exist
echo "📁 Creating configuration directories..."
mkdir -p "$CONFIG_DIR/hypr"
mkdir -p "$CONFIG_DIR/waybar"
mkdir -p "$CONFIG_DIR/kitty"
mkdir -p "$CONFIG_DIR/rofi"
mkdir -p "$CONFIG_DIR/dunst"
mkdir -p "$CONFIG_DIR/wlogout"
mkdir -p "$CONFIG_DIR/swaync"
mkdir -p "$CONFIG_DIR/fastfetch"
mkdir -p "$CONFIG_DIR/cava"
mkdir -p "$CONFIG_DIR/gtk-3.0"

# Copy configuration files
echo "📋 Copying configuration files..."
cp -r "$SCRIPT_DIR/config/hypr" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/waybar" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/kitty" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/rofi" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/dunst" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/wlogout" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/swaync" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/fastfetch" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/cava" "$CONFIG_DIR/"
cp -r "$SCRIPT_DIR/config/gtk-3.0" "$CONFIG_DIR/"

# Copy assets
echo "🎨 Copying assets..."
mkdir -p "$CONFIG_DIR/hypr/assets"
cp -r "$SCRIPT_DIR/assets" "$CONFIG_DIR/hypr/"

echo "✅ Installation complete!"
echo "🔄 Please log out and back in, or restart your display server to apply changes."
