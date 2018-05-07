#!/bin/bash

# adapted from
# https://github.com/paulmillr/dotfiles/blob/master/symlink-dotfiles.sh

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
    mv ~/$dotfile ~/${dotfile}_bak
    echo "$dotfile already existed and was renamed to ${dotfile}_bak"
  fi
  ln -s $dotfiles/$dotfile ~/$dotfile
done

unset dotfile
unset dotfiles


# if [[ `uname` == 'Darwin' ]]; then
#   link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
# fi
