# dotfiles
personal configuration files. updated to use [bare repo](https://www.atlassian.com/git/tutorials/dotfiles). 

## zshrc
using oh my zsh.

```alias config="/opt/homebrew/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER"```

```alias chad="~/.nvchad_config/.nvchad_sync.sh"```

## nvchad
The repo lives in `~/.config/nvim`. If you want to save edits to the config should do `config push` which will overwrite contents of `.nvchad_config` with `~/.config/nvim/lua/custom/` and then do `config push` to the remote automatically. If you want to get changes from the remote, should do `config pull` to update `.nvchad_config` directory. `chad put` will overwrite `~/.config/nvim/lua/custom/` with the contents of `.nvchad_config` minus the udpate script and DO_NOT_EDIT_HERE file. See `.nvchad_config/.nvchad_sync.sh` for details. Uses alias in zshrc to do `chad push` and `chad put` commands.

## oh my tmux
The repo lives in `.tmux` directory. I edit `.tmux.conf.local` to customize while `.tmux.conf` is symlinked to `.tmux/.tmux.conf`.
