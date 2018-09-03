#!/bin/bash


# Ask for the administrator password upfront
sudo -v


# update App Store apps
echo "Updating App Store apps..."
sudo softwareupdate -i -a


# Update Homebrew (Cask) & packages
echo "Updating Homebrew packages..."
brew update
brew upgrade


# Update npm & packages
echo "Updating npm global packages..."
npm install npm -g
npm update -g


# Update MS Office (if installed)
mdls /Applications/Microsoft\ Word.app -name kMDItemVersion
if [[ $? == 0 ]]; then
  echo "Updating MS Office..."
  /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install
fi
