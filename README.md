# dotfiles

My personal dotfiles &amp; terminal utilities

### Setup

```
# clone repo
git clone https://github.com/cristianradu/dotfiles.git ~/dotfiles

# run init script
~/dotfiles/init.sh
```

Init script will source all dotfiles and automatically add itself (once) to `~/.bashrc`

### Update

To keep the files up to date, run the update script:

```
~/dotfiles/update.sh
```

This will do a `git pull` and re-run the init script.
