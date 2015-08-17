#!/bin/bash
xsetroot -cursor_name left_ptr

feh --bg-fill .xmonad/Wallpaper.jpg

setxkbmap -layout es

xrdb -merge .Xresources

./.dropbox-dist/dropboxd &

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --height 12 --transparent true --alpha 0 --tint 0x000000 &

pnmixer &

exec xmonad
