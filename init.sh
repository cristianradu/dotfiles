#!/bin/bash

# source dotfiles
for dotfile in `~/dotfiles/list.sh`
do
    [ -f "$dotfile" ] && source "$dotfile"
done


# add this script to .bashrc (if not already there)
dotfilesInit="~/dotfiles/init.sh"

if ! grep -q $dotfilesInit ~/.bashrc; then
cat >> ~/.bashrc <<EOL

# dotfiles
# https://github.com/cristianradu/dotfiles
[ -f $dotfilesInit ] && source $dotfilesInit

EOL
fi
