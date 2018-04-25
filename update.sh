#!/bin/bash

cd ~/dotfiles
git pull

for DOTFILE in `list.sh`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done
