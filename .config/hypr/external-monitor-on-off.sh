#!/usr/bin/sh

monitor=HDMI-A-1

hyprctl monitors | grep -A17 HDMI-A-1 | grep -q "disabled: false"
monitor_disabled=$?

echo "monitor disabled: $monitor_disabled"

monitor_command=disable

if [ "${monitor_disabled}" -eq 1 ]; then
    echo "in if"
    monitor_command=enable
fi

echo "monitopr command: $monitor_command"

echo "Setting monitor ${monitor} state to ${monitor_command}"

hyprctl keyword monitor "${monitor}, ${monitor_command}"
