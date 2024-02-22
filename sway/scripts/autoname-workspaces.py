#!/usr/bin/python

'''
This script requires i3ipc-python package (install it from a system package manager or pip).
It adds icons to the workspace name for each open window.
Set your keybindings like this: `set $workspace1 workspace number 1`.
Add your icons to `WINDOW_ICONS`.

Based on
https://github.com/lgaboury/Sway-Waybar-Install-Script/blob/master/.config/sway/scripts/autoname-workspaces.py
which is based on
https://github.com/maximbaz/dotfiles/blob/master/bin/i3-autoname-workspaces
'''

from dataclasses import dataclass

import sys

import argparse
import signal
import logging

import i3ipc


# NOTES:
# - use only lowercase
# - assuming all icons to be ONE symbol (search for `ae36d1` in this file)
WINDOW_ICONS: dict[str, str] = {
    "alacritty": "", #   
    "btop": "󰄪",
    "discord": "", # 󰙯
    "firefox": "", # 󰈹
    "krita": "",
    "obs": "󰐾", # 󱔛 󰟞 󰐻 󰐾 󰻃 󰠿 󰚀 󱜠
    "ranger": "", #     
    "skype": "󰒯", # 
    "steam": "", # 
    "telegram": "", # 
    "zoom": "󰬇",
    #      
}

DEFAULT_ICON: str = "?"
ICONS_SEPARATOR: str = " "*1
NUMBER_ICONS_SEPARATOR: str = " "*2

NUMBER_TO_JP: dict[int, str] = {
    1: "一",
    2: "二",
    3: "三",
    4: "四",
    5: "く",
    6: "わ",
    7: "え",
    8: "ら",
    9: "あ",
    10: "す",
    11: "ディ",
    12: "ふ",
    13: "ざ",
    14: "か",
    15: "つ",
    16: "を",
}


def main():
    parser = argparse.ArgumentParser(
        description="This script automatically changes the workspaces names in Sway depending on opened applications."
    )
    parser.add_argument(
        "--duplicates",
        "-d",
        action="store_false", # so default is true
        help="Pass it if you don't want an icon for EACH instance of the same application per workspace.",
    )
    parser.add_argument(
        "--exact",
        "-e",
        action="store_true", # so default is false
        help="Pass it if you want to match names exactly (default is substring).",
    )
    parser.add_argument(
        "--logfile",
        "-l",
        type=str,
        default="/tmp/sway-autoname-workspaces.log",
        help="Path for the logfile.",
    )
    args = parser.parse_args()
    global ARGUMENTS
    ARGUMENTS = args

    logging.basicConfig(
        level=logging.INFO,
        filename=ARGUMENTS.logfile,
        filemode="w",
        format="%(message)s",
    )

    ipc = i3ipc.Connection()

    for sig in [signal.SIGINT, signal.SIGTERM]:
        signal.signal(sig, lambda _signal, _frame: undo_window_renaming_and_exit(ipc))

    def window_event_handler(ipc, event):
        if event.change in ["new", "close", "move"]:
            rename_workspaces(ipc)

    def workspace_event_handler(ipc, _event):
        # TODO: if.
        rename_workspaces(ipc)

    ipc.on("window", window_event_handler)
    ipc.on("workspace", workspace_event_handler)

    rename_workspaces(ipc)

    ipc.main()



def icon_for_window(window):
    if (app_id := window.app_id) is not None and len(app_id) > 0:
        app_id = app_id.lower()
        if icon := get_icon_for_window(app_id): # if not None
            return icon
        logging.info(f"No icon available for window with app_id: {app_id}")
    else:
        # xwayland support
        class_name = window.window_class
        if len(class_name) > 0:
            class_name = class_name.lower()
            if icon := get_icon_for_window(class_name): # if not None
                return icon
            logging.info(f"No icon available for window with class_name: {class_name}")
    # if not found by `app_id` or `class_name` then try by `window_name`
    if icon := get_icon_for_window(window.name): # if not None
        return icon
    return DEFAULT_ICON


def get_icon_for_window(app_id_or_class_name: str) -> None | str:
    for window_name, window_icon in WINDOW_ICONS.items():
        if is_this_window(window_name, app_id_or_class_name):
            return window_icon
    return None


def is_this_window(window_name: str, app_id_or_class_name: str) -> bool:
    if ARGUMENTS.exact:
        if window_name == app_id_or_class_name:
            return True
    else:
        if window_name in app_id_or_class_name:
            return True
    return False



@dataclass
class WorkspaceMyName:
    num: int
    name: str
    icons: list[str]

    @staticmethod
    def renamed_from_string(fullname: str) -> "WorkspaceMyName":
        num = get_workspace_number_from_fullname(fullname)
        name = "NA"
        icons = ""
        # TODO: refactor this mess.
        for key, value in NUMBER_TO_JP.items():
            if fullname.startswith(value):
                num = key
                name = value
                icons = fullname[len(value):]
        icons = list(icons.strip()) # `ae36d1`: here we assume that icons consist of only one symbols
        return WorkspaceMyName(num=num, name=name, icons=icons)


def get_workspace_number_from_fullname(fullname: str) -> int:
    return int(fullname.split(":")[0])



def rename_workspaces(ipc):
    # reversed to make them in order I want them to be
    for workspace in reversed(ipc.get_tree().workspaces()):
        workspace_my_name: WorkspaceMyName = WorkspaceMyName.renamed_from_string(workspace.name)
        icons = []
        for window in workspace:
            if window.app_id is not None or window.window_class is not None:
                icon = icon_for_window(window)
                if not ARGUMENTS.duplicates and icon in icons:
                    continue
                icons.append(icon)
        workspace_my_name.icons = icons
        new_name = construct_workspace_name(workspace_my_name)
        ipc.command(f"rename workspace '{workspace.name}' to '{new_name}'")


def construct_workspace_name(workspace_my_name: WorkspaceMyName):
    # this `<n>:` is required for sway/waybar to know workspace's actual number
    new_name = str(workspace_my_name.num) + ":"
    new_name += NUMBER_TO_JP[int(workspace_my_name.num)]
    if workspace_my_name.icons:
        new_name += NUMBER_ICONS_SEPARATOR + ICONS_SEPARATOR.join(workspace_my_name.icons)
    return new_name



def undo_window_renaming_and_exit(ipc):
    for workspace in ipc.get_tree().workspaces():
        new_name: int = get_workspace_number_from_fullname(workspace.name)
        ipc.command(f"rename workspace '{workspace.name}' to '{new_name}'")
    ipc.main_quit()
    sys.exit(0)



if __name__ == "__main__":
    main()

