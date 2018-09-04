#!/bin/bash


# Ask for the administrator password upfront
sudo -v


# update App Store apps
hr
echo -e "${BPurple}Updating App Store apps...${Reset}"
sudo softwareupdate -i -a


# update Homebrew packages
hr
echo -e "${Blue}Updating Homebrew packages...${Reset}"
brew update
brew upgrade


# update npm global packages
hr
echo -e "${BCyan}Updating npm global packages...${Reset}"
npm install npm -g
npm update -g


# update MS Office (if installed)
mdls /Applications/Microsoft\ Word.app -name kMDItemVersion > /dev/null
if [[ $? == 0 ]]; then
  hr
  echo -e "${BGreen}Updating MS Office...${Reset}"
  /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install
fi
