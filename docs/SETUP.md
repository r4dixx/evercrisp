## Configure a new installation

This guide assumes you're starting fresh (this is recommended). No migration, no anything. This is for the better.

If you're looking for how to migrate your configuration, check out [BACKUP.md](BACKUP.md).

Tested on: Macbook Pro 2021 - M1 Pro - macOS Monterey 12.2

### 1. Pre-requisites

#### a. Basic software

- Install all software updates:
```sh
sudo softwareupdate --install --all --verbose --restart
```

- Install Rosetta 2
```sh
sudo softwareupdate --install-rosetta
```

- Install basic command line tools:
```sh
xcode-select --install
```

- Install Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
```

- Install Oh My ZSH
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### b. Secrets

- Setup gpg
```sh
brew install --cask gpg-suite-no-mail
open /Applications/GPG\ Keychain.app/
```

Import keys from `.gpg/exports`

- Setup SSH
```sh
brew install secretive
open /Applications/Secretive.app
``` 

Create private keys and add their public equivalent where needed (GitLab, GitHub...)

#### c. Git

Several profiles according to folders can be created in `.gitconfig`.

Default ones are `git_config_user_perso` and `git_config_user_pro`:

```
[includeIf "gitdir:~/Dev/Repos/Perso/"]
	path = .gitconfig_user_perso
[includeIf "gitdir:~/Dev/Repos/Pro/"]
	path = .gitconfig_user_pro`
``` 

Customize to your likings

Profiles usually contain at least the following:

```
[user]
    name = yourname
    username = yourusername
    email = youremail
    signingkey = yoursignaturekey
```

### 2. Get crispy!

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

- Get submodules
```sh
evercrisp submodule update --init --remote
```

- Review files you backed up previously  
```sh
open $HOME/.evercrisp-backup
```

- Setup user in `.evercrisp/config` (usually the same than `git_config_user_perso`)

### 3. Software installation
  
The following steps will take a while. It is recommended to not touch anything during this time. Password can be asked several times during this process

- Install formulaes, casks and App Store installs (review `.package_lists/Brewfile` and add/remove entries according to your needs)
```sh
cd $HOME/.package_lists && brew bundle install --verbose
```

- Install language runtime versions (review `.tool-versions` and add/remove entries according to your needs)
```sh
grep -Eo '^[^ ]+' $HOME/.tool-versions | while read plugin ; do asdf plugin-add $plugin ; done
asdf install
asdf reshim
```

- Restore previously saved lists of packages (review everything in `.package_lists` and add/remove entries according to your needs)
```sh
cd $HOME/.package_lists
pip install -r pip_list
xargs gem install < gem_list
xargs npm install --global < npm_list
```

Run `asdf reshim` if some languages seem inexistant despite being installed

### 4. Additional Configuration

- Android Studio:
  - https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#settings-repository
  - https://plugins.jetbrains.com/plugin/7891-plugin-importer-exporter

- Visual Studio Code:
  - https://code.visualstudio.com/docs/editor/settings-sync

- iterm2
  - https://gitlab.com/gnachman/iterm2/-/wikis/back-up-preferences

- Install vim-plug
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Remove the quarantine attributes for quicklook plugins
```sh
xattr -r ~/Library/QuickLook # should have items
xattr -d -r com.apple.quarantine ~/Library/QuickLook
xattr -r ~/Library/QuickLook # should be empty
qlmanage -r
```

- Install bash-insulter
```sh
sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found
```

- Install [JoyPixels 6.6 for MacOS](https://www.joypixels.com/fonts)