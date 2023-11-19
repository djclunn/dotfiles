export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git web-search)
source $ZSH/oh-my-zsh.sh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
# homebrew path fix
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
## pyenv stuff
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# auto start tmux
if [[ $SHLVL -lt 2 ]]; then
  tmux new-session -A -s "$USER"
fi
# For a full list of active aliases, run `alias`.
# CONFIG EDITS
alias econf_zshrc="nvim ~/.zshrc"
# alias econf_ohmyzsh="nvim ~/.oh-my-zsh"
alias econf_tmux="nvim ~/.tmux.conf.local"
alias econf_vim="nvim ~/.config/nvim/lua/custom/chadrc.lua"
alias econf_chad="nvim ~/.config/nvim/lua/custom/chadrc.lua"
alias config="/opt/homebrew/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER"
alias chad="~/.nvchad_config/.nvchad_sync.sh"
# EDITOR ALIASES
alias vi=nvim
alias vim=nvim
# NVCHAD ALIASES
# PROJECT ALIASES
# alias pro_doc=
