#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in %HOMEPATH%/dotfiles
# Must be run in powershell to properly expand %HOMEPATH%
############################

########## Variables

dir=%HOMEPATH%/dotfiles                    # dotfiles directory
olddir=%HOMEPATH%/dotfiles_old             # old dotfiles backup directory
files="vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in %HOMEPATH%"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from %HOMEPATH% to $olddir"
    mv %HOMEPATH%/.$file %HOMEPATH%/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file %HOMEPATH%/.$file
done
