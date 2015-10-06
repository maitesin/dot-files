#!/bin/bash

xsetroot -cursor_name left_ptr

feh --bg-fill .config/Wallpaper.jpg

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --height 12 --transparent true --alpha 0 --tint 0x000000 &

setxkbmap -layout uk

dropbox &

pnmixer &

nm-applet &

xrdb -merge .Xresources

xbindkeys &

# Set WM name (for Java apps)
wmname LG3D

# Loop
while true
do
    # Set root title
    sh .xsetroot.sh
    # Check battery level
    BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
    STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
    if ([ $BATT -le 5 ] && [ $STATUS == 'Discharging' ]); then
	# Beep
	echo -e "\007" >/dev/tty10 && sleep 0.2
	echo -e "\007" >/dev/tty10 && sleep 0.2
	echo -e "\007" >/dev/tty10 && sleep 0.2
	# Blink
	echo 'on' > /proc/acpi/ibm/light && sleep 1
	echo 'off' > /proc/acpi/ibm/light
    fi
    # Update every 10s
    sleep 10s
done &

exec ck-launch-session dbus-launch dwm
