#!/bin/bash


# Ask for the administrator password upfront
sudo -v


# update App Store apps
echo -e "${Yellow}Updating App Store apps...${Reset}"
sudo softwareupdate -i -a


# update Homebrew packages
echo -e "\n${Blue}Updating Homebrew packages...${Reset}"
brew update
brew upgrade


# update npm global packages
echo -e "\n${Purple}Updating npm global packages...${Reset}"
npm install npm -g
npm update -g


# update MS Office (if installed)
mdls /Applications/Microsoft\ Word.app -name kMDItemVersion > /dev/null
if [[ $? == 0 ]]; then
  echo -e "\n${Green}Updating MS Office...${Reset}"
  /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install
fi
