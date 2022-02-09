#!/bin/sh

# dmyTRUEk's script for manually lock screen

delay_turn_off_screen=10

tmp_file=/tmp/for_sway_scripts__lock_screen_manually__swayidle_pid.txt

{
    swaylock
    # while `swaylock` is on the command is not finished,
    # so kill will be executed only when the screen is unlocked
    this_swayidle_pid="$(cat $tmp_file)"
    kill -9 $this_swayidle_pid
} & \
{
    swayidle -w \
        timeout $delay_turn_off_screen 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
    & \
    this_swayidle_pid=$! && echo $this_swayidle_pid > $tmp_file
}

