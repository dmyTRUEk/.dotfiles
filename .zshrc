# dmyTRUEk's ZSH config file

# If you come from bash you might have to change your $PATH.
path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/Android/Sdk/platform-tools")
#path+=('/opt/android-studio/jre/bin')
#path+=("$HOME/Development/flutter/bin")
#path+=('/snap/bin/rust-analyzer')
export PATH
#export MANPATH="/usr/local/man:$MANPATH"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# robbyrussell (default)
# blikns ~
# dstufft
# jispwoso
# juanghurtado ~
# refined
# smt ~
# strug
# ys
# powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=/usr/share/zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(git textmate lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    rust
)

source $ZSH/oh-my-zsh.sh



#### User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
    export VISUAL='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"

# eval $(thefuck --alias)

export RANGER_LOAD_DEFAULT_RC=false


export ANDROID_HOME="$HOME/Android/Sdk"

export ANDROID_NDK="/opt/android-ndk"
# Some programs such as gradle ask this as well:
export ANDROID_NDK_HOME="/opt/android-ndk"
# Some other programs like Godot wants this:
export ANDROID_NDK_ROOT="/opt/android-ndk"

#export JAVA_HOME="/etc/java-11-openjdk"



# this can be used to enter BINDS FREE shell:
#bindkey -N mykeymap .safe
#bindkey -A mykeymap main

# unbind keybinds:
# to input '^L' as single character, press Ctrl+V -> Ctrl+L
#bindkey -r '^D' # TODO: HOW TO UNBIND IT?
bindkey -r '^H'
bindkey -r '^J'
bindkey -r '^K'
bindkey -r '^L'
# TODO: unbind: <C-2> - <C-8>
#bindkey -r '^@'
#bindkey -r '^['
#bindkey -r '^\'
#bindkey -r '^]'
#bindkey -r '^^'
#bindkey -r '^_'

# bind keybinds:
bindkey -M main '^H' backward-char
bindkey -M main '^J' history-substring-search-down
bindkey -M main '^K' history-substring-search-up
bindkey -M main '^L' forward-char
# TODO: bind: <C-backspace> - backspace word
#bindkey -M main '^?' backward-kill-word



### My Custom Aliases for Terminal:

function warn_deprecated {
    echo "\`$1\` is deprecated, use \`$2\` instead."
    python -c 'input("Press enter to continue...")'
}

# Useful aliases:
#alias cl='clear' # real `cl` is further in this file
alias cdd='cd ~/.dotfiles'
alias cdc='cd ~/.config'
alias mkdir='mkdir -p'
alias please='sudo'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias grep='grep -i --color'
alias whereami='pwd'
alias findtextinfiles='grep -rn'
# TODO?: `cd path/to/non/existing/folder | m` to create that folder
function mcd {
    mkdir "$1"
    cd "$1"
}
compdef mcd=cd

## Useful programs:
alias l='lsd'
alias la='lsd -A'
alias ll='lsd -Al'
alias duai='dua i'
#alias cat='bat'
#alias find='fd'
#alias du='dua'
#alias fzf='sk'
# Arch only:
alias yay='paru'
function pacls {
    pacman -Ql $1 | grep -v '/$'
}

alias v='vim'

## NEOVIM related:
alias neovim='nvim'
alias n='nvim'
alias n.='nvim .'
alias nd='nvim -d'
# some specific files:
# TODO: open all this files even when not in root of project (find root by `.git/`)
alias nre='nvim README.md'
alias nl='nvim src/lib.rs'
function nm {
    local MAIN_FILE_C="main.c"
    local MAIN_FILE_CPP="main.cpp"
    local MAIN_FILE_LATEX="main.tex"
    local MAIN_FILE_PYTHON='main.py'
    local MAIN_FILE_RUST="src/main.rs"
    local MAIN_FILE_RUST_IN_SRC="main.rs"
    local MAIN_FILE_RUST_LIB="src/lib.rs"
    local MAIN_FILE_RUST_LIB_IN_SRC="lib.rs"

    if [[ -f "$MAIN_FILE_C" ]]; then
        # `$@` - all positional arguments, e.g. `+:42`, `-o file2`, etc.
        nvim "$MAIN_FILE_C" $@

    elif [[ -f "$MAIN_FILE_CPP" ]]; then
        nvim "$MAIN_FILE_CPP" $@

    elif [[ -f "$MAIN_FILE_LATEX" ]]; then
        nvim "$MAIN_FILE_LATEX" $@

    elif [[ -f "$MAIN_FILE_PYTHON" ]]; then
        nvim "$MAIN_FILE_PYTHON" $@

    elif [[ -f "$MAIN_FILE_RUST" ]]; then
        nvim "$MAIN_FILE_RUST" $@

    elif [[ -f "$MAIN_FILE_RUST_IN_SRC" ]]; then
        nvim "$MAIN_FILE_RUST_IN_SRC" $@

    elif [[ -f "$MAIN_FILE_RUST_LIB" ]]; then
        nvim "$MAIN_FILE_RUST_LIB" $@

    elif [[ -f "$MAIN_FILE_RUST_LIB_IN_SRC" ]]; then
        nvim "$MAIN_FILE_RUST_LIB_IN_SRC" $@

    else
        echo 'No known main file found.'
    fi
}
function o {
    cd $1 && nm
}
alias nc='nvim Cargo.toml'
alias ncl='nvim Cargo.lock'
# config files:
alias na='nvim ~/.config/alacritty/alacritty.toml'
alias ne='nvim ~/.config/eww/eww.yuck'
alias ni='nvim ~/.config/swayimg/config'
alias ng='nvim ~/.config/gammastep/config.ini'
alias nk='nvim ~/.config/kitty/kitty.conf'
alias nn='nvim ~/.config/nvim/init.lua'
alias np='nvim ~/.dotfiles/init_interactive_python.py'
alias nr='nvim ~/.config/ranger/rc.conf'
alias ns='nvim ~/.config/sway/config'
alias nu='nvim ~/.config/nvim/UltiSnips/'
alias nw='nvim ~/.config/waybar/config'
alias ny='nvim ~/.config/anyrun/config.ron'
alias nz='nvim ~/.zshrc'
alias nza='nvim ~/.config/zathura/zathurarc'
alias nzh='nvim ~/.zsh_history'

## GIT related:
alias g='git'
alias ga='git add'
alias ga.='git add .'
alias gap='git add --patch'
alias gap.='git add --patch .'
alias gb='git branch'
alias gc='git commit'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcl='git clone'
alias gcm='git commit -m'
alias gd='git diff'
alias gd.='git diff .'
alias gds='git diff --staged'
alias gds.='git diff --staged .'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gl='git log --oneline --decorate --graph'
alias gm='git merge'
alias gmt='git mergetool'
alias gpull='git pull'
alias gpush='git push'
alias grs='git restore --staged'
alias grs.='git restore --staged .'
alias grsp='git restore --staged --patch'
alias grsp.='git restore --staged --patch .'
alias gs='git status -u --find-renames=1'
alias gss='git status'

# real `cl`
function cl {
    clear
    if git rev-parse --git-dir > /dev/null 2>&1; then # is git repo
        gs
    fi
}

# rust related:
alias cc='cargo clean'
alias ct='cargo test'
alias ctr='cargo test --release'
alias ctrn='RUSTFLAGS="-C target-cpu=native" cargo test --release'

alias cr='cargo run'
alias crr='cargo run --release'
alias crrn='RUSTFLAGS="-C target-cpu=native" cargo run --release'
function ctcr { ( cargo test && cargo run $@ ) }
function ctcrr { ( cargo test && cargo run --release $@ ) }
function ctcrrn { ( cargo test && RUSTFLAGS='-C target-cpu=native' cargo run --release $@ ) }

alias cb='cargo build'
alias cbr='cargo build --release'
alias cbrn='RUSTFLAGS="-C target-cpu=native" cargo build --release'
alias ctcb='cargo test && cargo build'
alias ctcbr='cargo test && cargo build --release'
alias ctcbrn='cargo test && RUSTFLAGS="-C target-cpu=native" cargo build --release'


# custom scripts:
alias whatismyip='curl -s https://icanhazip.com'
alias whatismylocalip='ip addr | grep -oE "192\.168\.[0-9]{1,3}\.[0-9]{1,3}" | head -n 1'
alias dv='yt-dlp'
alias dm='yt-dlp -x --audio-format mp3 --embed-thumbnail --embed-metadata'
alias dm_without_covers='yt-dlp -x --audio-format mp3 --embed-metadata'
alias interactive_python='python -i ~/.dotfiles/init_interactive_python.py'
alias ipy='interactive_python'
function random_hash {
    local default_len=6
    local hash_len=$default_len
    if [[ -n $1 ]]; then
        local hash_len=$1
    fi
    echo $(date +%s%N | sha512sum | cut -c -$hash_len)
}

