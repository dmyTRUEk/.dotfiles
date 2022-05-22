#!/bin/sh

# dmyTRUEk's script for manually lock screen

delay_turn_off_screen=10

swayidle -w \
    timeout $delay_turn_off_screen 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

swaylock
# While `swaylock` is on, the command is not finished,
# so kill will be executed only when the screen is unlocked.
pkill swayidle

exec swayidle -w before-sleep '/home/myshko/.config/sway/scripts/lock_screen_manually.sh'

