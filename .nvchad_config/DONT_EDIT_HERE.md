# nvchad config
Instead of editing here, should edit in `~/.config/nvim/lua/custom` and then do `chad push` to sync with remote repo when ready to commit changes.

If you want to get changes from the remote, should do `config pull` to update the nvchad user directory and then `chad put` to put it in the chad directory.

See `.zshrc` and `.nvchad_config/.nvchad_sync.sh` for details.

Uses alias in zshrc `alias chad="~/.nvchad_config/.nvchad_sync.sh"` to do `chad push` and `chad put` commands.


