status_path=$XDG_RUNTIME_DIR/trackpad-disabled

if [ ! -f "${status_path}" ] ; then
    notify-send -u normal "Disable Touchpad"
    hyprctl keyword "device[synps/2-synaptics-touchpad]:enabled" false
    touch $status_path
else
    notify-send -u normal "Enabling Touchpad"
    hyprctl keyword "device[synps/2-synaptics-touchpad]:enabled" true
    /usr/bin/rm $status_path
fi
