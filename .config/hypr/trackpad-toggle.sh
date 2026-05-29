status_path=$XDG_RUNTIME_DIR/trackpad-disabled

# Find device with: hyprctl devices
# device_name=synps/2-synaptics-touchpad
device_name=synaptics-tm3512-010

nextState=""

if [ ! -f "${status_path}" ] ; then
    message="disabled"
    nextState=false
    touch $status_path
else
    message="enabled"
    nextState=true
    /usr/bin/rm $status_path
fi

notify-send -u normal "Trackpad $message"
hyprctl eval "hl.device({ name = \"$device_name\", enabled = $nextState })"
