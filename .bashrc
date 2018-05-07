# global definitions
[ -f /etc/bashrc ] && source /etc/bashrc


# dotfiles
# https://github.com/cristianradu/dotfiles
for dotfile in ~/dotfiles/.{aliases,colors,functions,exports,inputrc,iterm2,prompt};
do
  [ -f "$dotfile" ] && source "$dotfile"
done
unset dotfile

# --------------------------------------
