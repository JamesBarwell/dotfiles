#!/bin/sh

defaultTemp=6000
warmTemp=3500

nowTemp=$(hyprctl hyprsunset temperature)

# 1 if temperature is set warm
nowState=$( [ "$nowTemp" -eq $warmTemp ] && echo "1" || echo "0" )

# Invert state
nextState=$((1-$nowState))

# Set display temperature
if [ $nextState -eq 1 ]; then
    hyprctl hyprsunset temperature $warmTemp
else
    hyprctl hyprsunset temperature $defaultTemp
fi

echo "Set display temperature from $nowState to $nextState"
