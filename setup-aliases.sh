#!/bin/sh

# dmyTRUEk's setup aliases script
#
# run it:
# sh aliases-setup.sh



# TODO: rewrite using functions

# My Custom ALIASes:
alias_name="ff" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec firefox" > $alias_path && chmod +x $alias_path

alias_name="tg" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\nXCURSOR_THEME=breeze_cursors\nexec telegram-desktop" > $alias_path && chmod +x $alias_path

alias_name="fm" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\nXCURSOR_THEME=breeze_cursors\nexec dolphin" > $alias_path && chmod +x $alias_path

alias_name="pm" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec pamac-manager" > $alias_path && chmod +x $alias_path

alias_name="sm" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec plasma-systemmonitor" > $alias_path && chmod +x $alias_path

alias_name="ds" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\nexec discord" > $alias_path && chmod +x $alias_path

alias_name="anst" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\n_JAVA_AWT_WM_NONREPARENTING=1 android-studio" > $alias_path && chmod +x $alias_path

alias_name="pych" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#\!/bin/sh\n_JAVA_AWT_WM_NONREPARENTING=1 pycharm" > $alias_path && chmod +x $alias_path

# TODO: set column number
alias_name="nvimura" && alias_path=$HOME/.local/bin/$alias_name && echo -e "#!/bin/sh\nzathura -x \"nvr --remote \\\"+call cursor(%{line}, 0)\\\" %{input}\" \$1" > $alias_path && chmod +x $alias_path

