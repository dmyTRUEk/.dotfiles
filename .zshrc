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
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
#export NDK_HOME="$HOME/Android/Sdk/ndk/21.4.7075529"
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

## Useful programs:
alias l='lsd'
alias la='lsd -a'
alias ll='lsd -al'
alias duai='dua i'
alias yay='paru'
#alias cat='bat'
#alias find='fd'
#alias du='dua'
#alias fzf='sk'

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

alias v='vim'

## NEOVIM related:
alias neovim='nvim'
alias n='nvim'
alias n.='nvim .'
alias nd='nvim -d'
# some specific files:
# TODO: open all this files even when not in root of project (find root by `.git/`)
alias nre='nvim README.md'
function nm {
    MAIN_FILE_C="main.c"
    MAIN_FILE_CPP="main.cpp"
    MAIN_FILE_LATEX="main.tex"
    MAIN_FILE_PYTHON='main.py'
    MAIN_FILE_RUST="src/main.rs"
    if [[ -f "$MAIN_FILE_C" ]]; then
        # `$@` - all positional arguments, e.g. `+:42`, `-o file2`.
        nvim "$MAIN_FILE_C" $@

    elif [[ -f "$MAIN_FILE_CPP" ]]; then
        nvim "$MAIN_FILE_CPP" $@

    elif [[ -f "$MAIN_FILE_LATEX" ]]; then
        nvim "$MAIN_FILE_LATEX" $@

    elif [[ -f "$MAIN_FILE_PYTHON" ]]; then
        nvim "$MAIN_FILE_PYTHON" $@

    elif [[ -f "$MAIN_FILE_RUST" ]]; then
        nvim "$MAIN_FILE_RUST" $@

    else
        echo 'No known main file found.'
    fi
}
alias nc='nvim Cargo.toml'
# config files:
alias na='nvim ~/.config/alacritty/alacritty.yml'
alias nk='nvim ~/.config/kitty/kitty.conf'
alias nn='nvim ~/.config/nvim/init.vim'
alias nr='nvim ~/.config/ranger/rc.conf'
alias ns='nvim ~/.config/sway/config'
alias nu='nvim ~/.config/nvim/UltiSnips/'
alias nw='nvim ~/.config/waybar/config'
alias ny='nvim ~/.config/yofi/yofi.config'
alias nz='nvim ~/.zshrc'
alias nza='nvim ~/.config/zathura/zathurarc'
alias nzh='nvim ~/.zsh_history'

## GIT related:
alias g='git'
alias ga.='git add .'
alias ga='git add'
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



# custom scripts:
alias countlinesofcode='res=0; for f in $(tree -fiF --noreport | grep -v /$ | tail -n +2); do res=$(($res+$(cat $f | sed "/^\s*$/d" | wc -l))); done; echo $res'
alias whatismyip='curl -s https://icanhazip.com'
alias whatismylocalip='ip addr | rg -o "192\.168\.\d{1,3}\.\d{1,3}" | head -n 1'
alias dv='yt-dlp'
alias dm='yt-dlp -x --audio-format mp3 --embed-thumbnail --embed-metadata'
alias interactive_python="python -ic 'from math import *; import numpy as np'"

