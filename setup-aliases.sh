#!/bin/sh

# dmyTRUEk's aliases setup file
#
# run it:
# sh aliases-setup.sh



# My Custom ALIASes:
alias_name="ff" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec firefox" > $alias_path && chmod +x $alias_path

alias_name="tg" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\nXCURSOR_THEME=breeze_cursors\nexec telegram-desktop" > $alias_path && chmod +x $alias_path

alias_name="fm" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\nXCURSOR_THEME=breeze_cursors\nexec dolphin" > $alias_path && chmod +x $alias_path

alias_name="pm" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec pamac-manager" > $alias_path && chmod +x $alias_path

alias_name="sm" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec plasma-systemmonitor" > $alias_path && chmod +x $alias_path

alias_name="ds" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec discord" > $alias_path && chmod +x $alias_path

alias_name="anst" && alias_path=$(xdg-user-dir)/.local/bin/$alias_name && echo -e "#\!/bin/sh\n_JAVA_AWT_WM_NONREPARENTING=1 android-studio" > $alias_path && chmod +x $alias_path



