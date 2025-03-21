#!/bin/bash
current_layout=$(hyprctl getoption general:layout | head -n1 | cut -d ' ' -f2)
if [ "$current_layout" == "dwindle" ]; then
    hyprctl keyword general:layout "master"
    echo "Switched layout to master."
else
    hyprctl keyword general:layout "dwindle"
    echo "Switched layout to dwindle."
fi
