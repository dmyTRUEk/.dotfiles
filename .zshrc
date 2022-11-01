# dmyTRUEk's ZSH config file

# If you come from bash you might have to change your $PATH.
path+=('/home/myshko/.local/bin')
path+=('/home/myshko/.cargo/bin')
path+=('/home/myshko/Android/Sdk/platform-tools')
#path+=('/opt/android-studio/jre/bin')
#path+=('/home/myshko/Development/flutter/bin')
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
bindkey -r '^H'
bindkey -r '^J'
bindkey -r '^K'
bindkey -r '^L'
#bindkey -r '^D' # HOW TO UNBIND IT?

# bind keybinds:
bindkey -M main '^H' backward-char
bindkey -M main '^J' history-substring-search-down
bindkey -M main '^K' history-substring-search-up
bindkey -M main '^L' forward-char



### My Custom Aliases for Terminal:

## Useful programs:
alias ls='lsd'
alias la='lsd -a'
alias ll='lsd -al'
alias duai='dua i'
alias yay='paru'
#alias cat='bat'
#alias find='fd'
#alias du='dua'
#alias fzf='sk'

# Useful aliases:
alias cl='clear'
alias cdd='cd ~/.dotfiles'
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
mcd() {
    mkdir "$1"
    cd "$1"
}

alias v='vim'

## NEOVIM related:
alias neovim='nvim'
alias n='nvim'
alias n.='nvim .'
alias nd='nvim -d'
alias nre='nvim README.md'
# TODO: some way to check if it is Rust or Python
alias nm='nvim src/main.rs'
# config files:
alias nc='nvim ~/.config/nvim/init.vim'
alias na='nvim ~/.config/alacritty/alacritty.yml'
alias nk='nvim ~/.config/kitty/kitty.conf'
alias nr='nvim ~/.config/ranger/rc.conf'
alias ns='nvim ~/.config/sway/config'
alias nu='nvim ~/.config/nvim/UltiSnips/'
alias nw='nvim ~/.config/waybar/config'
alias ny='nvim ~/.config/yofi/yofi.config'
alias nz='nvim ~/.zshrc'
alias nzh='nvim ~/.zsh_history'

## GIT related:
alias g='git'
alias ga.='git add .'
alias ga='git add'
alias gap.='git add --patch .'
alias gap='git add --patch'
alias gb='git branch'
alias gc='git commit'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcl='git clone'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --decorate --graph'
alias gm='git merge'
alias gmt='git mergetool'
alias gpull='git pull'
alias gpush='git push'
alias grs.='git restore --staged .'
alias grs='git restore --staged'
alias grsp='git restore --staged --patch'
alias gs='git status -u --find-renames=1'
alias gss='git status'

alias grenamelastcommit='git stash && git rebase -i HEAD~1 && gpush --force && git stash pop'



# custom scripts:
alias countlinesofcode='res=0; for f in $(tree -fiF --noreport | grep -v /$ | tail -n +2); do res=$(($res+$(cat $f | sed "/^\s*$/d" | wc -l))); done; echo $res'
alias whatismyip='curl -s https://icanhazip.com'
alias whatismylocalip='ip addr | rg -o "192\.168\.\d{1,3}\.\d{1,3}" | head -n 1'

