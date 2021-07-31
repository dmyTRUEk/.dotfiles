#!/bin/sh

# This file leaves real files in ~/.dotfiles
#   and makes links in all needed locations

# files:
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# folders:
ln -sfn ~/.dotfiles/alacritty ~/.config/
ln -sfn ~/.dotfiles/mako ~/.config/
ln -sfn ~/.dotfiles/sway ~/.config/
ln -sfn ~/.dotfiles/waybar ~/.config/



