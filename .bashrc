# global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

# dotfiles
# https://github.com/cristianradu/dotfiles
for dotfile in ~/dotfiles/.{aliases,colors,functions,exports,inputrc,iterm2,macos,options,prompt};
do
  [ -f "$dotfile" ] && source "$dotfile"
done
unset dotfile

# local environment settings
[ -f ~/.bash.local ] && source ~/.bash.local

# --------------------------------------
