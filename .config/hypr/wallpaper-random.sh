#!/usr/bin/env bash

MONITOR_NAME=$1
RESOLUTION=$2

WALLPAPER_DIR="$HOME/wallpapers/$RESOLUTION"

#CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
#PRIMARY_WALLPAPER_PATH=$(find "$PRIMARY_MONITOR_WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Select random wallpapers for each monitor
WALLPAPER_PATH=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload $MONITOR_NAME,"$WALLPAPER_PATH"
