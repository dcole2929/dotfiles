# Doug Farmer's Dotfiles
Minimal ZSH configuration which should be suitabale for MacOS, Linux, and WSL

## Prerequisites
For installation `stow` `git` and `zsh` must be installed. This zsh config additionally requires the `asdf` package manager to be installed.

## Install
``` 
cd ~
git clone <repo>
stow configuration
```

To install a configuration execute ```stow <folder>``` from within the dotfiles directory.
For example ```stow zsh``` will create symlinks in ~ for .zshrc

## NOTES
Make sure you have installed GNU stow ```sudo apt install stow```

The dotfiles repo must be cloned to home directory. In order for stow to place files in correct location Stow assumes that the contents of the `<dir>` you specify should live one directory above where the stow command is run, so having our .dotfiles directory at ~/.dotfiles means using stow to manage our dotfiles just works.

If you wish to clone elsewhere use ```stow --target=~ <configuration>```

If a file already exists (such as .zshrc) then stow will fail with a conflict warning, this is the desired behavior so that existing configuration is not lost. If you wish to overwrite an existing configuration you must manually delete the existing file(s) and rerun stow.

## git
Update name and email.

IncludeIf allows user to maintain multiple git accounts on one machine and to read config from a separate location. Remove if no need to maintain separate accounts

## zsh
This configuration assumes the user is using oh-my-zsh -> https://ohmyz.sh/
The configuration uses the spaceship prompt which has several dependencies. Namely the powerline fonts -> https://github.com/denysdovhan/spaceship-prompt#installing

This zsh config assumes that asdf package manager is installed to manage language versions. Either comment out/remove the last line or install `asdf`.

If not on linux must install zsh-autosuggestions -> https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

## aliases
Some of these aliases are specific to MacOS. Comment out or otherwise remove ones that don't work on your distro. 

Known Mac specific commands: f ql trash emptytrash show hide hidedesktop showdesktop stfu pumpitup  afk
