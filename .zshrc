# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# robbyrussell simple custom
ZSH_THEME="powerlevel10k/powerlevel10k"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  web-search
  vi-mode
  # tmux
  history
  git
  # git-open
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
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

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
alias dsk="cd ~/Desktop"
alias num-sum="awk '{sum += \$1};END {print sum}'"
alias cp="cp -i"
alias mv="mv -i"
alias rm="trash"

# view
alias ip="ifconfig -a | grep 192.168 | awk '{print \$2}'"

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
alias deti="docker exec -it"
alias docker-rmi-none="docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi"
alias docker-runc-nginx="docker run -it --rm --network=my-network --name nginx -v $(pwd):/usr/share/nginx/html -p 80:80 192.168.43.122/base/nginx:1.15"
alias docker-sorti="docker images --format '{{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}' | sort -k 2 -h -r"

# kubectl
alias kube-memory-sum="kubectl top pod --all-namespaces --sort-by memory | awk 'NR != 1 {print \$4}' | replace Mi '' | num-sum"
alias kube-deployment-stop-all="kubectl get deployment | awk 'NR != 1 {print \$1}' | xargs kubectl scale deployment --replicas=0"
alias kube-pod-delete-not-running="kubectl get pods | grep -v Running | awk 'NR != 1 {print \$1}' | xargs kubectl delete pod"
alias kube-top="kubectl top pod --all-namespaces --sort-by memory"
alias kx="kubectx"
alias kns="kubens"
alias kube-del-pod-force="kubectl delete pod --force --grace-period=0"

# kettle spoon
alias spoon='nohup /usr/share/data-integration-8.2-bigdata/spoon.sh > /dev/null &'

alias emacsc='nohup emacsclient -c > /dev/null &'
alias emacst='emacsclient -t'

alias xfce-i3 "sudo x11docker --xorg --hostdisplay --user=root --clipboard --sharedir='/home/kense/data/limeng/data/VirtualBox VMs/share' x11docker/xfce"
alias xfce-tty "sudo x11docker --xorg --desktop --user=root --clipboard --sharedir='/home/kense/data/limeng/data/VirtualBox VMs/share' x11docker/xfce"

# cscope
export CSCOPE_DB=$HOME/.cscope/cscope_db

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

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# mysql client
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql-client@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client@5.7/include"

source ~/.company-aliases.sh

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$($HOME'/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="$HOME/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
