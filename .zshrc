# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/Users/kense/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# robbyrussell simple custom
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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # web-search
  # vi-mode
  # tmux
  # history
  git
  zsh-syntax-highlighting
  jsontools
  kubectl
  zsh-autosuggestions
  autojump
  fzf
  zsh-completions
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export DEFAULT_USER="kense"

# autojump
[[ -s /Users/kense/.autojump/etc/profile.d/autojump.sh ]] && source /Users/kense/.autojump/etc/profile.d/autojump.sh

# docker autocomplete
autoload -U compinit && compinit -u

# 在命令执行的过程中，使用小红点进行提示
COMPLETION_WAITING_DOTS="true"

# zsh vi mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^Z' clear-screen

function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg_bold[yellow]%} -- % NORMAL --% %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# ssh default vi mode
ssh() {
	if [ "$#" -eq 0 ]; then
		/usr/bin/ssh
	elif [ "$#" -eq 1 ]; then
		/usr/bin/ssh "$1" -t bash -o vi
	else
		/usr/bin/ssh $@
	fi
}

# operation
alias cls="clear"
alias copy="clipcopy"
alias num-sum="awk '{sum += \$1};END {print sum}'"

# proxy
alias q="http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890"
alias proxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891"

# xdg-open
alias op="open"

# translation
alias z="trans :zh"
alias e="trans :en"
alias zz="trans :zh -sp"
alias ee="trans :en -p"
alias t="trans :zh -I"
alias tt="trans :zh -sp -I"

# git
alias gsc="git svn dcommit --interactive"

# man
alias cman='man -M /usr/share/man/zh_CN'

# docker
alias docker-rmi-none="docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi"

# kubectl
alias kube-memory-sum="kubectl top pod --all-namespaces --sort-by memory | awk 'NR != 1 {print \$4}' | replace Mi '' | num-sum"
alias kube-deployment-stop-all="kubectl get deployment | awk 'NR != 1 {print \$1}' | xargs kubectl scale deployment --replicas=0"
alias kube-pod-delete-not-running="kubectl get pods | grep -v Running | awk 'NR != 1 {print \$1}' | xargs kubectl delete pod"
alias kube-top="kubectl top pod --all-namespaces --sort-by memory"

# kettle spoon
alias spoon='nohup /usr/share/data-integration-8.2-bigdata/spoon.sh > /dev/null &'

alias emacsc='nohup emacsclient -c > /dev/null &'
alias emacst='emacsclient -t'

alias xfce-i3 "sudo x11docker --xorg --hostdisplay --user=root --clipboard --sharedir='/home/kense/data/limeng/data/VirtualBox VMs/share' x11docker/xfce"
alias xfce-tty "sudo x11docker --xorg --desktop --user=root --clipboard --sharedir='/home/kense/data/limeng/data/VirtualBox VMs/share' x11docker/xfce"

# cscope
export CSCOPE_DB=/Users/kense/.cscope/cscope_db

# helm autocompletions
# source <(helm completion zsh)

# default editor
export EDITOR=/usr/local/bin/vim

# gist default browser
export BROWSER=chromium

# go
export PATH=$PATH:/usr/local/go/bin

# fzf

# kubectx and kubens
export PATH=~/.kubectx:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# mysql client
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql-client@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client@5.7/include"

source ~/.company-aliases.sh

