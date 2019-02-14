#!/bin/bash

# Setting the wallpaper
feh --bg-fill .config/Wallpaper.jpg

# Setting the keyboard layout to UK english.
setxkbmap -layout gb

# Launching dropbox.
dropbox &

# Launching pulse audio mixer (the icon shown in the system tray).
pnmixer &

# Launching clipboard manager.
clipit &

# To set colours and configuration for Urxvt
xrdb .Xresources

# Mapping spanish stuff in my keyboard
xbindkeys &
xmodmap .Xmodmap

# Set WM name (for Java apps)
wmname LG3D

# Autolock screen
xautolock -time 15 -locker 'xlock -mode blank' &

# Trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 6 --height 17 --transparent true --alpha 0 --tint 0x000000 &

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

# Starting session with DWM
exec dwm
