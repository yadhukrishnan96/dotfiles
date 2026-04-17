#!/bin/bash

WALL_DIR="$HOME/wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"

# pick wallpaper
WALL=$(find "$WALL_DIR" -type f | fzf \
  --preview 'chafa --size=60x30 {}' \
  --preview-window=right:60%)

[ -z "$WALL" ] && exit 0

WALL=$(realpath "$WALL")

# save current wallpaper
echo "$WALL" > "$CACHE_FILE"

# set wallpaper
pkill swaybg 2>/dev/null
swaybg -i "$WALL" -m fill &

# allow compositor to settle
sleep 0.2

# generate theme
wallust run "$WALL"

# -------------------------
# WAYBAR SYNC (IMPORTANT)
# -------------------------
if [ -f ~/.cache/wallust/style.css ]; then
    cp ~/.cache/wallust/style.css ~/.config/waybar/style.css
elif [ -f ~/.cache/wallust/waybar.css ]; then
    cp ~/.cache/wallust/waybar.css ~/.config/waybar/style.css
elif [ -f ~/.cache/wallust/colors-waybar.css ]; then
    cp ~/.cache/wallust/colors-waybar.css ~/.config/waybar/style.css
fi

# reload waybar
pkill waybar 2>/dev/null
waybar >/dev/null 2>&1 &


notify-send "Theme updated" "$(basename "$WALL")"
