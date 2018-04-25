#!/bin/bash

dotfilesUrl="https://github.com/cristianradu/dotfiles"

if grep -q $dotfilesUrl ~/.bashrc; then
    exit 0
fi

cat >> ~/.bashrc <<EOL

# dotfiles
# $dotfilesUrl
for dotfile in \`~/dotfiles/list.sh\`
do
    [ -f "\$dotfile" ] && source "\$dotfile"
done

EOL
