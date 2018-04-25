#!/bin/bash

cd ~/dotfiles
git pull

for dotfile in `~/dotfiles/list.sh`
do
    [ -f "$dotfile" ] && source "$dotfile"
done
