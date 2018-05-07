#!/bin/bash

# pull latest version of the repo
cd ~/dotfiles
git pull --ff-only

# source dotfiles
source ~/.bash_profile
