#!/bin/python3

import subprocess
import os

apps = {
    "Alacritty": "alacritty",
    "Android Studio": "_JAVA_AWT_WM_NONREPARENTING=1 android-studio",
    "Discord": "discord",
    "Discord Canary": "discord-canary",
    "Firefox": "firefox",
    "Image Viewer": "imv",
    "Inkscape": "inkscape",
    "Kdenlive": "kdenlive",
    "Kitty": "kitty",
    "Krita": "krita",
    "Libre Office": "libreoffice",
    "OBS Studio": "obs",
    "Ocenaudio": "ocenaudio",
    "SciDAVis": "scidavis",
    "Skype": "skypeforlinux",
    "Steam": "steam",
    "Telegram Desktop": "telegram-desktop",
    "Zathura": "zathura",
    "Zoom": "zoom",
    "qt5ct": "qt5ct",
}

app_names_list = list(apps)
app_names_str = '\n'.join(app_names_list)

command_yofi = f'/home/myshko/.cargo/bin/yofi dialog <<< "{app_names_str}"'
app_name_to_launch = subprocess.getoutput(command_yofi)
app_bin_to_launch = apps[app_name_to_launch]

# Pass the final command to swaymsg so that the resulting window can be opened on the original workspace that the command was run on.
command_exec = f"echo {app_bin_to_launch} | xargs swaymsg exec --"
os.system(command_exec)

