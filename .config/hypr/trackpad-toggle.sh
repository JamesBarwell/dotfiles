status_path=$XDG_RUNTIME_DIR/trackpad-disabled

# Find device with: hyprctl devices
# device_name=synps/2-synaptics-touchpad
device_name=synaptics-tm3512-010

if [ ! -f "${status_path}" ] ; then
    notify-send -u normal "Disable Touchpad"
    hyprctl keyword "device[${device_name}]:enabled" false
    touch $status_path
else
    notify-send -u normal "Enabling Touchpad"
    hyprctl keyword "device[${device_name}]:enabled" true
    /usr/bin/rm $status_path
fi
