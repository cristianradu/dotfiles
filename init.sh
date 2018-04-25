#!/bin/bash

# source dotfiles
for dotfile in `~/dotfiles/list.sh`
do
    [ -f "$dotfile" ] && source "$dotfile"
done


# add this script to .bashrc (if not already there)
dotfilesInit="~/dotfiles/init.sh"

if grep -q $dotfilesInit ~/.bashrc; then
    exit 0
fi

cat >> ~/.bashrc <<EOL

# dotfiles
# https://github.com/cristianradu/dotfiles
$dotfilesInit

EOL
