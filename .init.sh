#! /bin/bash

# DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
pkgs=(
         'xterm'
         'xorg-server'
         'xorg-xinit'
         'xorg-xmodmap'
         'xf86-video-vesa'
         'base-devel'
         'sudo'
         'git'
         'tmux'
         'python3'
         'ipython'
         'python-numpy'
         'vim'
         'openbox'
         'obconf'
         'zsh'
         'firefox'
         )
aur_pkgs=(
         'oh-my-zsh-git'
         'slimux-git'
         'vim-pathogen-git'
         )

echo "Installing packages..."

# get some sane defaults going
echo "Grabbing sane defaults"
git clone https://github.com/djclunn/dotfiles

# run the installation command
echo "Installing sane defaults"
cd dotfiles
./install.sh

# switch shell to zsh
echo "switching to zsh"
chsh -s $(which zsh)

# extendedglob
# autoload -UZ zsh-newuser-install


