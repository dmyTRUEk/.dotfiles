#!/bin/sh

# dmyTRUEk's setup config files links script
# 
# This file leaves real files in ~/.dotfiles
#   and makes links in all needed locations

# TODO: maybe use it?
# BASEDIR=$(dirname "$0")
# echo "$BASEDIR"

# files:
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# folders:
ln -sfn ~/.dotfiles/alacritty ~/.config/
ln -sfn ~/.dotfiles/imv ~/.config/
ln -sfn ~/.dotfiles/mako ~/.config/
ln -sfn ~/.dotfiles/nvim ~/.config/
ln -sfn ~/.dotfiles/paru ~/.config/
ln -sfn ~/.dotfiles/ranger ~/.config/
ln -sfn ~/.dotfiles/sway ~/.config/
ln -sfn ~/.dotfiles/swaylock ~/.config/
ln -sfn ~/.dotfiles/waybar ~/.config/
ln -sfn ~/.dotfiles/yofi ~/.config/
ln -sfn ~/.dotfiles/zathura ~/.config/

