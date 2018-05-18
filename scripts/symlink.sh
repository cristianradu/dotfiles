#!/bin/bash

# -- definitions -----------------------

dotfiles=~/dotfiles

# colors
Reset='\033[0m'
Yellow='\033[0;33m'       # Yellow
BRed='\033[1;31m'         # Bright Red
BGreen='\033[1;32m'       # Bright Green
BYellow='\033[1;33m'      # Bright Yellow
BBlue='\033[1;34m'        # Bright Blue


backup_file () {
  # if a second param is given, append the contents of the input file to it
  if [[ $2 ]]; then
    echo "# $1" >> 2
    cat $1 >> $2
    appended="Its contents was appended to ${BGreen}$2${Reset}."
  fi

  # backup the existing file, either with .bak or a timestamp
  if [[ -f $1.bak ]]; then
    now=`date +%Y%m%d-%H%M%S`
    mv $1 $1.$now
    echo -e "${BYellow}$1${Reset} already exists and so is its backup. The file was renamed to ${Yellow}${dotfile}.$now${Reset}. $appended";
    unset now
  else
    mv $1 $1.bak
    echo -e "${BYellow}$1${Reset} already exists and was renamed to ${Yellow}${dotfile}.bak${Reset}. $appended";
  fi
}

symlink_file () {
  if [[ -h ~/$1 ]]; then
    if [[ ! "$(readlink ~/$1)" -ef "$dotfiles/$1" ]]; then
      echo -e "${BRed}$1${Reset} is already symlinked, but not to its version in dotfiles!";
      exit 1;
    else
      echo -e "${BGreen}$1${Reset} is already symlinked";
    fi
  else
    if [[ -f ~/$1 ]]; then
      backup_file $1 $2
    fi  
    ln -s $dotfiles/$1 ~/$1
    echo -e "${BGreen}$1${Reset} symlinked successfully";
  fi  
}

# -- create symlinks -------------------

# check for the dotfiles dir
if [[ -d $dotfiles ]]; then
  echo -e "Symlinking dotfiles from ${BBlue}$dotfiles${Reset}";
else
  echo -e "${BRed}$dotfiles${Reset} does not exist!";
  exit 1;
fi

# bash_profile
symlink_file .bash_profile .bash.local
symlink_file .bashrc .bash.local
symlink_file .editorconfig
symlink_file .gitconfig .gitconfig.local
symlink_file .gitignore

unset dotfiles

# -- source dotfiles -------------------

source ~/.bash_profile
