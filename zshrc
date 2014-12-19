# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"
#ZSH_THEME="flazz"
#ZSH_THEME=“agnoster”

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git go)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Users/bdowns/gocode/bin:/usr/local/go/bin

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export GOROOT=/usr/local/go
export GOPATH=/Users/bdowns/gocode
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:/usr/local/go_appengine

# General
alias lt='ls -ltra'
alias ll='ls -l'
alias c='clear'
alias grep='grep --color'

## GIT Aliases
alias gp='git pull'
alias gs='git status'

alias vag='vagrant'

## Find files
function ff() { find . -type f -iname '*'$*'*' -ls ; }

## Search google for the given keywords.
export VIEW='/usr/bin/open -a "/Applications/Google Chrome.app"'
function url-encode() { setopt extendedglob; echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}" }
function google() { $(${VIEW}) "http://www.google.com/search?q=`url-encode "${(j: :)@}"`" }

## Grep the history
function h() { history 0 | grep $1 }

## Setup tab title and shit
function title() {
  if [[ $TERM == "screen"* ]]; then
    print -nR $'\033k'$1$'\033\\'
    print -nR $'\033]0;'$2$'\a'
  fi
}

function precmd() { title "zsh" "$PWD" }
function preexec {
  emulate -L zsh
  local -a cmd; cmd=(${(z)1})
  title "$cmd[1]:t" "$cmd[2,-1]"
}

## Process functions
function pid() { ps aux | grep -i ${1} | grep -v grep }
function ppid() { ps -p ${1:-$$} -o ppid=; }

## Go functions
function ggg() { go get github.com/$1 }
