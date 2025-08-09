#!/usr/bin/sh

monitor=HDMI-A-1
hyprctl monitors | grep HDMI-A-1
monitor_is_disabled=$?

# Invert the current disabled state
monitor_disabled_state=$((1-$monitor_is_disabled))

echo "Setting monitor ${monitor} disabled state to ${monitor_disabled_state}"

hyprctl keyword monitorv2[$monitor]:disabled $monitor_disabled_state
