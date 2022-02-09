# [dmyTRUEk](https://github.com/dmyTRUEk)'s dotfiles for [Sway](https://swaywm.org/)

It works on [Arch](https://archlinux.org/), [Manjaro](https://manjaro.org/),
and any other [GNU/Linux](https://www.getgnulinux.org/) distro,
where you can install all needed programs.



## Contents:
### Configs:
- [NeoVim](https://github.com/dmyTRUEk/dotfiles/blob/main/nvim/init.vim)
- [Alacritty](https://github.com/dmyTRUEk/dotfiles/blob/main/alacritty/alacritty.yml)
- [Sway](https://github.com/dmyTRUEk/dotfiles/tree/main/sway/config)
  - [Waybar](https://github.com/dmyTRUEk/dotfiles/tree/main/waybar)
  - [Mako](https://github.com/dmyTRUEk/dotfiles/blob/main/mako/config)
  - [Swaylock](https://github.com/dmyTRUEk/dotfiles/blob/main/swaylock/config)
  - [Yofi](https://github.com/dmyTRUEk/dotfiles/blob/main/yofi/yofi.config)
- [Zsh](https://github.com/dmyTRUEk/dotfiles/blob/main/.zshrc) + Oh My ZSH!
- [Ranger](https://github.com/dmyTRUEk/dotfiles/tree/main/ranger)
- [Zathura](https://github.com/dmyTRUEk/dotfiles/blob/main/zathura/zathurarc)
- [Paru](https://github.com/dmyTRUEk/dotfiles/blob/main/paru/paru.conf)
  \- yay alanog written in Rust

### Setup Scripts:
- [setup-file-links](https://github.com/dmyTRUEk/dotfiles/blob/main/setup-file-links.sh)
  \- creates symbolic links in desired locations to real dotfiles
  (real dotfiles located in `~/.dotfiles/`)



## Screenshots:
![Screenshot](screenshots/screenshot.png)



## Useful Links:
- [Useful add ons for sway](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)



## Other Sway dotfiles:
- [Sway Default](https://github.com/swaywm/sway/blob/master/config.in)
- [Sunderland93 (yt: Aleksey Samoilov)](https://github.com/Sunderland93/dotfiles-sway)
- [Mel34](https://gist.github.com/Mel34/ab9b6d562f9181ed8bbdc7c76022b85b)
- [fluix-dev](https://github.com/fluix-dev/dotfiles)
- [MIAH7](https://github.com/MIAH7/dotfiles)
- [MuratovAS](https://github.com/MuratovAS/dotfiles)
- [1edenec](https://github.com/1edenec/ledosway)
- [ivanmilov (alacritty)](https://github.com/ivanmilov/dots_work_ttt/blob/master/home_dir/.config/alacritty/alacritty.yml)
- [kraftwerk28](https://github.com/kraftwerk28/dotfiles)



## FAQ - Frequently Asked Questions:

### Some symbols doesnt show correctly
Solution: install `ttf-font-awesome` package

### Mouse Cursor in some app is wrong
Solution:

1. Set `XCURSOR_THEME=your_cursor_theme` before launching app

### Screenshare doesn't work
- in Firefox:  
  Solution: google webrtc?
- in Discord, Telegram:  
  Solution:
  1. Launch OBS
  2. Translate your screen to virtual camera
    if it is not available, install `v4l2loopback-dkms`
  3. Use it in discord/telegram

### Screencasting (screenrecording)
Solution: use [wf-recorder](https://github.com/ammen99/wf-recorder)

### Enviroment variables of two (or more) DE/WM conflicts
Solution:

1. Create file `/usr/local/bin/sway` and write in it:

  ```
  XDG_CURRENT_DESKTOP=sway \
      VAR1=... \
      VAR2=... \
      /usr/bin/sway
  ```
2. Give executable permission to this file: `chmod +x /usr/local/bin/sway`
3. In your `sway.desktop` file (located in `/usr/share/wayland-sessions`) edit `Exec=sway` to `Exec=/usr/local/bin/sway`

### Run JetBrains (or other Java based apps)
Solution: `_JAVA_AWT_WM_NONREPARENTING=1\n<your_app_name>`



