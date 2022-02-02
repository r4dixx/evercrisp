## Backup a configuration

As you probably figured it out, most things must be backed up using `evercrisp` and its git-like functionalities. However, some stuff must be done manually.
  
### First of all, let's have a clean state

- Make sure everything is ok when you run `evercrisp status`
- Upgrade everything: `update_all`
- reboot

### Now let's backup

- Save existing Homebrew formulaes and App store installs as a list (review `.package_lists/Brewfile` and add/remove entries according to your needs)
```sh
cd $HOME/.package_lists
brew bundle dump --force
```

- Save other packages as lists (review `.package_lists` and add/remove entries according to your needs)
```sh
cd $HOME/.package_lists
pip-chill --no-version > pip_list
ls `npm root -g` > npm_list
gem list --no-versions > gem_list
```

- Migrate gpg keys
```sh
open /Applications/GPG\ Keychain.app/
```

Export keys to `.gpg/exports`. Do not commit them on public repos! Either commit on a private repo or transfer them manually to your new computer.

- Android Studio:
  - https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#settings-repository
  - https://plugins.jetbrains.com/plugin/7891-plugin-importer-exporter

- Visual Studio Code:
  - https://code.visualstudio.com/docs/editor/settings-sync

- iterm2
  - https://gitlab.com/gnachman/iterm2/-/wikis/back-up-preferences