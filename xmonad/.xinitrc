#!/bin/bash

xsetroot -cursor_name left_ptr

feh --bg-fill .xmonad/Wallpaper.jpg

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --height 12 --transparent true --alpha 0 --tint 0x000000 &

setxkbmap -layout uk

pnmixer &

xrdb -merge .Xresources

xbindkeys &

# Set WM name (for Java apps)
wmname LG3D

exec xmonad
