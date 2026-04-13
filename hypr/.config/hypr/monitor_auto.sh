#!/bin/bash

if hyprctl monitors | grep -q "HDMI-A-1"; then
    hyprctl keyword monitor "HDMI-A-1,1920x1080@60,0x0,1"
    hyprctl keyword monitor "eDP-1,disable"
else
    hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.5"
fi
