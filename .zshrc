# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch
unsetopt notify
bindkey -v
export ZSH=$HOME"/.oh-my-zsh"
## # Set name of the theme to load.
## # Look in ~/.oh-my-zsh/themes/
## # Optionally, if you set this to "random", it'll load a random theme each
## # time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

## # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## # Example format: plugins=(rails git textmate ruby lighthouse)
## plugins=(gitfast git-extras archlinux encode64 pip ruby tmux vi-mode web-search)
## 
plugins=(git common-aliases colored-man-pages per-directory-history web-search tmux)
# to be added 
# virtualenvwrapper
# syntax highlighting (custom)
# tmux
# tmuxinator?
# vi-mode?
# wd?
# z
### My Stuff
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
## pyenv stuff
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
else
    echo "NO OH MY ZSH FOLDER?"
fi

alias ls="ls --color=auto"
alias ll="ls -l"
alias lrt="ls -lrt"
alias la="ls -A"
alias lg="ls --g"
alias lag="ls -A --g"
alias ..="cd .."

alias v="vim"
# replaced by L alias l="less"

alias diff="diff --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias evimrc="vim ~/.config/nvim/init.vim"
alias etmuxconf="vim ~/.tmux.conf"
alias ezshrc="vim ~/.zshrc"

# #search through the history with up or down using first word
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
# 
# # # # #fix terminal issues
# bindkey '^[[H' beginning-of-line
# bindkey '^[[F' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '[1~' beginning-of-line
# bindkey '[4~' end-of-line

#set the editor
export EDITOR="nvim"
alias vim="nvim"

## auto start tmux
if [[ $SHLVL -lt 2 ]]; then
  tmux new-session -A -s "$USER"
fi


