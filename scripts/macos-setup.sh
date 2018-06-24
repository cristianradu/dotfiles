#!/bin/bash

# https://github.com/paulmillr/dotfiles/blob/master/bootstrap-new-system.sh

echo 'Enter new hostname of the machine (e.g. macbook)'
  read hostname
  echo "Setting new hostname to $hostname..."
  scutil --set HostName "$hostname"
  compname=$(sudo scutil --get HostName | tr '-' '.')
  echo "Setting computer name to $compname"
  scutil --set ComputerName "$compname"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"

# echo 'Tweaking macOS...'
  # source '~/dotfiles/.macos'


# install Homebrew if not already present
which -s brew
if [[ $? != 0 ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update Homebrew and existing formulae
brew update
brew upgrade

# install  bundle support and execute the Brewfile
brew tap homebrew/bundle
brew bundle

# add hostnames to /etc/hosts
# setup ssh auto login in ~/.ssh/config
