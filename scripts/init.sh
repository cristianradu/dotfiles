#!/bin/bash

# source dotfiles
for dotfile in ~/dotfiles/.{aliases,colors,exports,inputrc,iterm2,prompt};
do
  [ -f "$dotfile" ] && source "$dotfile"
done
for dotfile in `find ~/dotfiles/functions -type f`;
do
  [ -f "$dotfile" ] && source "$dotfile"
done


# add this script to .bashrc (if not already there)
dotfilesInit="~/dotfiles/scripts/init.sh"

if ! grep -q $dotfilesInit ~/.bashrc; then
cat >> ~/.bashrc <<EOL

# dotfiles
# https://github.com/cristianradu/dotfiles
[ -f $dotfilesInit ] && source $dotfilesInit

EOL
fi
