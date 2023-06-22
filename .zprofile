# dmyTRUEk's ZSH profile file

# Set XDG_CURRENT_DESKTOP:
# moved into /usr/local/bin/sway, which must be called from /usr/share/wayland-sessions/sway.desktop
# (needed for screensharing via PipeWire and xdg-desktop-portal-wlr)
#export XDG_CURRENT_DESKTOP=sway

# Default apps
export EDITOR=nvim
export BROWSER=firefox

# Qt
# ? moved into /usr/local/bin/sway, which must be called from /usr/share/wayland-sessions/sway.desktop
export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME=qt5ct

# Firefox
export MOZ_ENABLE_WAYLAND=1

# SDL
#export SDL_VIDEODRIVER=wayland

