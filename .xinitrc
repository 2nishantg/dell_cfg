#!/bin/bash
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto


[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

setxkbmap -option 'ctrl:swapcaps'
xset r rate 200 50
exec /usr/bin/i3
