# Welcome to evercrisp 👨‍💻🚀

The ultimate developer configuration for macOS devices

## What about it?

`evercrisp` is based on [Atlassian's approach to dotfiles](https://www.atlassian.com/git/tutorials/dotfiles). Basically, your home folder acts just like a git repository. It's a simple, customizable and elegant way to manage your macOS configuration and settings.

As Atlassian puts it:

> No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

## How does it work exactly? 

- Clone this repo into a bare repository:  
```sh
git clone --bare git@github.com:r4dixx/evercrisp.git $HOME/.evercrisp
```

- Define an alias in the current shell scope:  
```sh
alias evercrisp='/usr/bin/git --git-dir=$HOME/.evercrisp --work-tree=$HOME'
```

- Checkout and backup files that would be overwritten by checkout:  
```sh
mkdir -p .evercrisp-backup && \
evercrisp checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .evercrisp-backup/{}
```
    
- Re-run the check out if you had problems:  
```sh
evercrisp checkout
```
  
- Do not show untracked files on this specific (local) repository:  
```sh
evercrisp config --local status.showUntrackedFiles no
```

- (optional) Get submodules
```sh
evercrisp submodule update --init --remote
```

- Review files you backed up previously  
```sh
open $HOME/.evercrisp-backup
```

Wanted to keep some files as they were? Migrate them back to your home folder. 

Don't care about them? Delete the folder. 

Do as you please but if you want to be on the safe side leave this folder as is and move on. Better safe than sorry.

## Warning

Be careful to never ever ever share any gpg key, ssh key or other secret publicly. If you want to be on the safe side, I recommend you create a private repository and use this repository as upstream.

## Now simply use `evercrisp` just like you would use `git`

 You can add, commit, pull, push any new or existing file. Here's a simple example:

```sh
evercrisp add file
evercrisp commit -m "Adding new file to my dotfiles"
evercrisp push
```

## Why `evercrisp`?

EverCrisp is an apple cultivar that has won many spurs these past few years. Its success is due to its special sweetness, crispness and its ability to store very well. All in all a safe choice for apple consumers 🍎😋

[More about EverCrisp](https://en.wikipedia.org/wiki/EverCrisp)

