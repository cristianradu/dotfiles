#!/bin/bash

find ~/dotfiles -type f | grep -v "/.git" | grep -v "README" | grep -v ".sh"
