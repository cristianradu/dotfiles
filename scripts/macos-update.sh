#!/bin/bash


# Ask for the administrator password upfront
sudo -v


# Color definitions
Reset='\033[0m'
# Normal
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White


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
