#!/bin/sh

# dmyTRUEk's setup config files links script
# 
# This file leaves real files in ~/.dotfiles
#   and makes links in all needed locations

# TODO: refactor to functions and for loops

# files:
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# folders:
ln -sfn ~/.dotfiles/alacritty ~/.config/
ln -sfn ~/.dotfiles/anyrun ~/.config/
ln -sfn ~/.dotfiles/eww ~/.config/
ln -sfn ~/.dotfiles/gammastep ~/.config/
ln -sfn ~/.dotfiles/imv ~/.config/
ln -sfn ~/.dotfiles/kitty ~/.config/
ln -sfn ~/.dotfiles/mako ~/.config/
ln -sfn ~/.dotfiles/nvim ~/.config/
ln -sfn ~/.dotfiles/paru ~/.config/
ln -sfn ~/.dotfiles/ranger ~/.config/
ln -sfn ~/.dotfiles/sway ~/.config/
ln -sfn ~/.dotfiles/swayimg ~/.config/
ln -sfn ~/.dotfiles/swaylock ~/.config/
ln -sfn ~/.dotfiles/systemd ~/.config/
ln -sfn ~/.dotfiles/waybar ~/.config/
ln -sfn ~/.dotfiles/yofi ~/.config/
ln -sfn ~/.dotfiles/zathura ~/.config/

# custom applications' desktop entries:
ln -sf ~/.dotfiles/apps/ranger-in-kitty.desktop ~/.local/share/applications/
ln -sf ~/.dotfiles/apps/nvim-in-alacritty.desktop ~/.local/share/applications/

