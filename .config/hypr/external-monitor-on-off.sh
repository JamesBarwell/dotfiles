#!/bin/sh

monitor=HDMI-A-1

# 1 if external monitor is disabled
hyprctl monitors | grep $monitor > /dev/null
nowState=$?

# Invert state
nextState=$((1-$nowState))

# Set monitor
hyprctl keyword monitorv2[$monitor]:disabled $nextState

echo "Set $monitor disabled from $nowState to $nextState"
