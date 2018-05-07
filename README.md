# dotfiles

My personal dotfiles &amp; terminal utilities

### Install

```bash
# clone repo
git clone https://github.com/cristianradu/dotfiles.git ~/dotfiles

# run symlink script
~/dotfiles/scripts/symlink.sh
```

Symlink script will link the dotfiles that need to reside in the user's home (existing ones will be renamed with a timestamp) and source the necessary ones.

### Update

To keep the files up to date, run the update script:

```bash
~/dotfiles/scripts/update.sh
```

This will do a `git pull` and re-source the dotfiles.

### Local Settings

For machine-specific settings you can create a `~/.bash.local` file and add there any necessary commands. The file will get sourced automatically. Example:

```bash
export PATH="$PATH:~/dotfiles/scripts"
```
For local git settings (i.e. different user name/email), create a `~/.gitconfig.local` file. Example:

```
[user]
  name = Cristian Radu
  email = hi@cristianradu.com
```
