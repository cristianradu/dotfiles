#!/bin/bash

# adapted from
# https://github.com/paulmillr/dotfiles/blob/master/symlink-dotfiles.sh

today=`date "+%Y%m%d"`
dotfiles="~/dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles:"
else
  echo "$dotfiles does not exist!"
  exit 1
fi

for dotfile in .{bash_profile,bashrc,editorconfig,gitconfig,gitignore};
do
  if [[ -f ~/$dotfile ]]
    mv ~/$dotfile ~/${dotfile}.$today
    echo "$dotfile already existed and was renamed to ${dotfile}.$today"
  fi
  ln -s $dotfiles/$dotfile ~/$dotfile
done

unset dotfile
unset dotfiles
unset today

# source dotfiles
source ~/.bash_profile
