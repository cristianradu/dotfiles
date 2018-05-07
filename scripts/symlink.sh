#!/bin/bash

# adapted from
# https://github.com/paulmillr/dotfiles/blob/master/symlink-dotfiles.sh

today=`date "+%Y%m%d"`
# colors
Reset='\033[0m'
Yellow='\033[0;33m'       # Yellow
BRed='\033[1;31m'         # Bright Red
BGreen='\033[1;32m'       # Bright Green
BYellow='\033[1;33m'      # Bright Yellow
BBlue='\033[1;34m'        # Bright Blue

dotfiles=~/dotfiles

if [[ -d $dotfiles ]]; then
  echo -e "Symlinking dotfiles from ${BBlue}$dotfiles${Reset}";
else
  echo -e "${BRed}$dotfiles${Reset} does not exist!";
  exit 1;
fi

for dotfile in .{bash_profile,bashrc,editorconfig,gitconfig,gitignore};
do
  if [[ -h ~/$dotfile ]]; then
    echo -e "${BGreen}$dotfile${Reset} is already symlinked";
  else
    if [[ -f ~/$dotfile ]]; then
      mv ~/$dotfile ~/${dotfile}.$today
      echo -e "${BYellow}$dotfile${Reset} already existed and was renamed to ${Yellow}${dotfile}.$today${Reset}";
    fi
    ln -s $dotfiles/$dotfile ~/$dotfile
  fi
done

unset dotfile
unset dotfiles
unset today

# source dotfiles
source ~/.bash_profile
