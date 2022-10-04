#!/bin/sh
###########################################
# USB/IP Auto Binder
# Version: 1.0
#
# https://github.com/dfc643/usbip-binder
###########################################

#__loading_driver__
modprobe usbip_core && modprobe usbip_host
if [ $? -eq 0 ]; then
    echo "usbip kernel module loaded!"
else
    echo "usbip kernel module load failed!"
    exit 1
fi

check_usbipd() {
    ps -ef | grep usbipd | grep -v grep >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        /usr/sbin/usbipd -D
        echo "usbip is started!"
    else
        echo "usbip is in running!"
    fi
}

bind_usb_all() {
    ls /sys/bus/usb/devices/ | grep -Eo '^[0-9]+-[1-9]+\.?[1-9]?$' | while read NEW_USB_ID 
    do
        if [ ! -d /sys/bus/usb/drivers/usbip-host/$NEW_USB_ID ]
        then
            echo "found device usb $NEW_USB_ID, binding ..."
            /usr/sbin/usbip bind -b $NEW_USB_ID >/dev/null 2>&1
            [ $? -eq 0 ] && echo "new device usb $NEW_USB_ID bind successfully"
        fi
    done
}

#__main__
check_usbipd
bind_usb_all
sleep 3
echo "usbip deamon is started, monitoring new usb devices ..."
while [ true ]; do
    bind_usb_all
    sleep 5
done
