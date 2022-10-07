#!/bin/sh

# dmyTRUEk's Discord picture-in-picture auto positioning script

# if its broken, use mkdir ~/test/updater_lt6_ge6 to see what works, and what no
if [ $(swaymsg -t get_tree | grep 'discord updater' -i | wc -l) -gt 0 ]; then
    true;
elif [ $(swaymsg -t get_tree | grep 'discord' -i | wc -l) -lt 6 ]; then
    swaymsg "[class=\"discord\"]" floating disable, sticky disable;
elif [ $(swaymsg -t get_tree | grep 'discord' -i | wc -l) -ge 6 ]; then
    sleep 1.0;
    swaymsg "[class=\"discord\"]" floating enable, sticky enable;
    swaymsg "[class=\"discord\" title=\"Discord\"]" floating disable, sticky disable;
fi #> ~/test/ok.txt 2> ~/test/error.txt

