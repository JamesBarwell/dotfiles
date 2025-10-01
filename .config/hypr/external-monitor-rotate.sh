#!/usr/bin/sh

monitor=HDMI-A-1

current_transform=$(hyprctl monitors | grep -A12 HDMI-A-1 | grep transform | grep -Eo '[0-9]')

next_translation=$((current_transform + 1))

if [ ${next_translation} = 4 ]; then
    next_translation=0
fi

echo "Rotating monitor ${monitor} from translation ${current_transform} to ${next_translation}"

hyprctl keyword monitorv2[$monitor]:transform $next_translation
