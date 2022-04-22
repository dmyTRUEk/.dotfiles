# dmyTRUEk's ZSH config file

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
# ZSH_CUSTOM=/usr/share/zsh

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
    git
    rust
    pip
    #antigen
    #archlinux
    #tmux
    #python
    #pylint
    #pep8
)

source $ZSH/oh-my-zsh.sh



#### User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# path+=('/home/myshko/Development/flutter/bin')
path+=('/home/myshko/Android/Sdk/platform-tools')
# path+=('/snap/bin/rust-analyzer')
path+=('/opt/android-studio/jre/bin')
path+=('/home/myshko/.local/bin')
export PATH

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

export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export NDK_HOME="$HOME/Android/Sdk/ndk/21.4.7075529"
export JAVA_HOME="/etc/java-11-openjdk"



### My Custom Aliases for Terminal:

## Useful programs:
alias ls='lsd'
alias la='lsd -a'
alias ll='lsd -al'
#alias cat='bat'
#alias find='fd'
#alias du='dua'
#alias fzf='sk'
alias yay='paru'

# Useful aliases:
alias cl='clear'
alias cdd='cd ~/.dotfiles'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias whereami='pwd'
alias findtextinfiles='grep -rn'

## NEOVIM related:
alias neovim='nvim'
alias n='nvim'
#alias v='nvim'
alias nc='nvim ~/.config/nvim/init.vim'
alias ns='nvim ~/.config/sway/config'
alias nu='nvim ~/.config/nvim/UltiSnips/'
alias nz='nvim ~/.zshrc'

## GIT related:
alias g='git'
alias gs='git status -u --find-renames=1'
alias gss='git status'
alias glog='git log --oneline --decorate --graph'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias ga.='git add .'
alias gap='git add --patch'
alias gap.='git add --patch .'
alias grs='git restore --staged'
alias grs.='git restore --staged .'
alias gc='git commit'
alias gcm='git commit -m'
alias gpush='git push'
alias gpull='git pull'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gb='git branch'
alias gm='git merge'
alias gmt='git mergetool'



# custom scripts:
alias countlinesofcode='res=0; for f in $(tree -fiF --noreport | grep -v /$ | tail -n +2); do res=$(($res+$(cat $f | sed "/^\s*$/d" | wc -l))); done; echo $res'

