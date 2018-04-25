#!/bin/bash

cd ~/dotfiles
git pull

for DOTFILE in `find ~/dotfiles -name "\.*" -type f | grep -v "/.git"`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done
