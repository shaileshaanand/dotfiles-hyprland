#!/bin/bash
CHOICE=$(echo "PowerOff|Logout|Reboot|Reboot to Windows 10|Restart Espanso service" | rofi -sep '|' -dmenu -i -p "Power Options")
if [ "$CHOICE" == "Reboot" ]
then
    systemctl reboot
fi
if [ "$CHOICE" == "PowerOff" ]
then
    systemctl poweroff
fi
if [ "$CHOICE" == "Reboot to Windows 10" ]
then
    sudo efibootmgr --bootnext $(efibootmgr|grep -i windows|awk '{print substr($1,5,4)}')
    systemctl reboot
fi

if [ "$CHOICE" == "Logout" ]
then
    hyprctl dispatch exit
fi
if [ "$CHOICE" == "Restart Espanso service" ]
then
    espanso restart
fi
