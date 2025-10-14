#!/bin/sh

monitor=HDMI-A-1

# Current transform state of monitor
nowState=$(hyprctl monitors | grep -A12 HDMI-A-1 | grep transform | grep -Eo '[0-9]')

# Increment state
nextState=$(($nowState + 1))
if [ ${nextState} = 4 ]; then
    nextState=0
fi

# Rotate monitor
hyprctl keyword monitorv2[$monitor]:transform $nextState

echo "Transform $monitor from $nowState to $nextState"
