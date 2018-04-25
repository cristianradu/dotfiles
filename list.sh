#!/bin/bash

find ~/dotfiles -name ".[^.]*" -type f \
    | grep -v ".gitignore" \
    | grep -v ".DS_Store" \
    | sort

find ~/dotfiles/functions -type f \
    | sort
