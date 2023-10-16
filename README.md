# [dmyTRUEk](https://github.com/dmyTRUEk)'s dotfiles

It works on [Arch](https://archlinux.org/), [Manjaro](https://manjaro.org/),
and any other [GNU/Linux](https://www.getgnulinux.org/) distro,
where you can install all required programs.



# Table of Contents:
## Configs:

### Text editors:
- NeoVim: [init.vim](nvim/init.vim)

### Sway related:
Sway: [config](sway/config) + [scripts](sway/scripts/)
- Waybar: [config](waybar/config) + [style.css](waybar/style.css) + [modules/kblayout](waybar/modules/kblayout)
- Yofi: [yofi.config](yofi/yofi.config)
- Swaylock: [config](swaylock/config)
- Mako: [config](mako/config)

### File managers and viewers:
- Ranger: [rc.conf](ranger/rc.conf)
  \+ [rifle.conf](ranger/rifle.conf)
  \+ [colorschemes/ala_gruvbox.py](ranger/colorschemes/ala_gruvbox.py)
- Zathura: [zathurarc](zathura/zathurarc)
- Imv: [config](imv/config)

### Terminal Emulators:
- Alacritty: [alacritty.yml](alacritty/alacritty.yml)
- Kitty: [kitty.conf](kitty/kitty.conf)

### Other:
- Shell: Zsh + Oh My ZSH!: [.zshrc](.zshrc)
  \+ [.zprofile](.zprofile)
- Aur helper: Paru: [paru.conf](paru/paru.conf)
- Custom "apps": [ranger-by-kitty.desktop](apps/ranger-by-kitty.desktop)
- Sddm theme: [theme.conf](sddm-themes/sugar-candy/theme.conf)
- Systemd services: [sway-relative-keyboard-rs.service](systemd/user/sway-relative-keyboard-rs.service)
- Vimium: [vimium-options.json](vimium/vimium-options.json)


## Setup Script:
- [setup-file-links.sh](setup-file-links.sh)
  \- creates symbolic links in desired locations to real dotfiles
  (real dotfiles located in `~/.dotfiles/`).



# Screenshot:
![Screenshot](https://raw.githubusercontent.com/dmyTRUEk/images/4819213f17725e363e88c1b2e4111f07589d4909/screenshot_sway_1.png)



# Useful Links:
- [Useful add ons for sway](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)
- [Rust Utilities](https://rustutils.com)



# Other Sway dotfiles:
- [Sway Default](https://github.com/swaywm/sway/blob/master/config.in)
- [Sunderland93 (yt: Aleksey Samoilov)](https://github.com/Sunderland93/dotfiles-sway)
- [Mel34](https://gist.github.com/Mel34/ab9b6d562f9181ed8bbdc7c76022b85b)
- [fluix-dev](https://github.com/fluix-dev/dotfiles)
- [MIAH7](https://github.com/MIAH7/dotfiles)
- [MuratovAS](https://github.com/MuratovAS/dotfiles)
- [1edenec](https://github.com/1edenec/ledosway)
- [ivanmilov (alacritty)](https://github.com/ivanmilov/dots_work_ttt/blob/master/home_dir/.config/alacritty/alacritty.yml)
- [kraftwerk28](https://github.com/kraftwerk28/dotfiles)



# Problems and Troubleshooting:

## Run JetBrains (or maybe other Java based apps)
Solution: add `env _JAVA_AWT_WM_NONREPARENTING=1` to app's `.desktop` file.

Or just run `_JAVA_AWT_WM_NONREPARENTING=1 <your_app_name>`.

## Wallpaper (Background) doesn't change
Solution: install `swaybg` package.

## Skype don't remember login
Install `gnome-keyring` package.

## Some symbols isn't displayed correctly (eg in waybar)
Solution: install corresponding package:  
- App icons in Sway (eg Wifi, Sound, Brightness, Keyboard layout, Firefox, Telegram, Discord, etc) ->
  `ttf-nerd-fonts-symbols-2048-em-mono` (or try `ttf-font-awesome`?).
- Japanese -> `adobe-source-han-sans-jp-fonts`.

## Setup default file opener
Solution: run `xdg-mime default <program>.desktop <filetype>`. You can find your program's desktop file at `~/.local/share/applications/` or `/usr/share/applications/`.

For example:
- `xdg-mime default org.pwmt.zathura.desktop application/pdf`
- `xdg-mime default ranger-by-kitty.desktop inode/directory`
- `xdg-mime default nvim-in-alacritty.desktop text/plain`

Other useful commands to find out the issue:
- `xdg-mime query filetype myfile.txt` => `text/plain`
- `xdg-mime query default text/plain` => `nvim-in-alacritty.desktop`
- `xdg-open myfile.txt` => opens a file by first possible application
- `XDG_UTILS_DEBUG_LEVEL=2 xdg-mime query default text/plain` => shows files that it searches in ([source](https://superuser.com/questions/962687/problems-with-using-xdg-mime-default-the-default-was-successfully-set-but-it-is))

If none of the above helps, try updating desktop database by this command: ([source](https://superuser.com/questions/962687/problems-with-using-xdg-mime-default-the-default-was-successfully-set-but-it-is))
```
update-desktop-database ~/.local/share/applications/
```

[source](https://unix.stackexchange.com/questions/36380/how-to-properly-and-easily-configure-xdg-open-without-any-environment)

## Screenshare doesn't work
- in Firefox:  
  Solution: google webrtc?
- in Discord, Telegram:  
  Solution:
  1. Launch OBS
  2. Translate your screen to virtual camera.  
    If it is not available, install `v4l2loopback-dkms`
    (or follow [this tutorial](https://github.com/hw0lff/screen-share-sway#Install-the-v4l2loopback-kernel-module)).
  3. Select virtual camera and then enable it in discord/telegram.

## Screenrecording
Solution: use OBS or [wf-recorder](https://github.com/ammen99/wf-recorder).

## Mouse Cursor in some app is wrong
Solution: set `XCURSOR_THEME=your_cursor_theme` before launching app.

## Enviroment variables of two (or more) DE/WM conflicts
Solution: in `/usr/share/wayland-sessions/sway.desktop` write `Exec=env XDG_CURRENT_DESKTOP=sway sway`.

## Kdenlive error:
- `mlt_repository_init: failed to dlopen`: install `libsdl` (on arch: `sdl_image`).

## Ranger crashes whole Sway session:
Steps to reproduce:
scroll in folder with many files with preview.

Explanation:
some process takes up all memory,
in my case `identify` process (looks like) had memory leak
when trying to identify `.djvu` file,
and `identify` binary belongs to `imagemagick`
(which can be verified by `man identify`).

Workaround: uninstall `imagemagick`.



# TODO:
- `! meta`: remove screenshots from `.git/`, so they don't take up space
- `neovim`: better autocompletitions:
  - set first option as default selected (sometimes it is, sometimes not)
  - sort (keywords (true/false), vars, funcs (local, global, external lib's, rust's), text(aka buffer))
- `neovim`: find/make binds for `var_name` <-> `VarName` <-> `VAR_NAME`
- `neovim`: change default rust snippets for macros (`println!()`, `todo!()`, `dbg!()`(also fix cursor position)) to have `;` at the end
- `sddm`: enable "tap to click"
- `sway`: bind for cut text and paste it in upper/lower case
- `ranger`: refactor maps (add two/three spaces after `map x`)
- `sway`: do smt with `sddm.service`, so that it dont freeze shutdown and reboot for 10 seconds
- `zathura`: make better color for `f`(follow link/ref)
- `sway`: in window resizing mode add binds for move window till edge, especially discord pop-up, etc
- `ranger`: binds for compressing/extracting archives (`zip`, `7z`, `tar.gz`, `tar`?)
- `lock screen`: fix bind: Win+Esc(physically Esc, but caps in os) presses caps, so password then is capsed
- `sway`: black screen while startup -> is it possible to set some image while it's loading, so there is no black screen
- `waybar`,`current layout`: if caps is enabled: `en`->`EN`, `ua`->`UA` (for caps try use [this](https://wayland-book.com/seat/xkb.html) or just read `/sys/class/leds/input3::capslock/brightness`)
- `zoom`: fix crashes when join by link (how?)
- `sway-relative-keyboard-rs`, `systemd`: even though it is systemd service, it sometimes stops when reloading sway config
- `sway`?: make Meta+Shift+Enter terminal be in scratchpad by default
- `kdeconnect`: fix mouse movement (impossible?)

