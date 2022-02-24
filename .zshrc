# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots (set with "true")
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="%F{yellow}%f"

# Uncomment the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically withou889t asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

###############################################################################

plugins=(

  ### INCLUDED

  # Autocomplete options for adb commands (including adb -s)
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/adb
  adb

  # Adds integration with asdf
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/asdf
  asdf

  # The plugin adds several aliases for common brew commands
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/brew
  brew

  # Colors for man pages
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/colored-man-pages
  colored-man-pages

  # Provides suggested packages to be installed if a command cannot be found
  # `command-not-found` package required
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/command-not-found
  command-not-found

  # Collection of useful zsh aliases
  # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#common-aliases
  # WARNING! CAN BREAK EXISTING ALIASES
  common-aliases

  # Copies the path of your current folder to the system clipboard
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath
  copypath

  # Copies the content of a file to the system clipboard
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/copyfile
  copyfile

  # Completions and aliases for `gem`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/gem
  gem

  # Provides aliases and functions for `git`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git
  git

  # Aliases for `history`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/history
  history

  # Completions and aliases for `npm`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm
  npm

  # macOS utilities
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx
  macos

  # Completions for `pip`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/pip
  pip

  # Aliases for `ruby`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ruby
  ruby

  # Press ESC twice to prefix your current or previous command with `sudo`
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sudo
  # WARNING! CONFLICTS WITH `thefuck`! Disable `thefuck` first.
  # sudo

  # Press ESC twice to correct previous console command
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/thefuck
  # WARNING! CONFLICTS WITH `sudo`! Disable `sudo` first.
  thefuck

  # Aliases for searching with Google, Wiki, Bing, YouTube and other popular services
  # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/web-search
  web-search

  ###############################################################################

  ### THIRD PARTY

  # Helps remembering those aliases you defined once
  # https://github.com/djui/alias-tips
  alias-tips

  # Zsh completion support for git-flow-avh
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-flow-avh
  git-flow-avh

  # Suggests commands as you type, based on command history
  # https://github.com/zsh-users/zsh-autosuggestions
  zsh-autosuggestions

  # Additional completion definitions for Zsh
  # https://github.com/zsh-users/zsh-completions
  zsh-completions

  # Fish shell like syntax highlighting for Zsh
  # https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-syntax-highlighting
)

###############################################################################

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Source Aliases
source $HOME/.zsh_aliases

# Source fzf
# https://github.com/junegunn/fzf#as-vim-plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source bash-insulter
# https://github.com/hkbakke/bash-insulter
if [ -f /etc/bash.command-not-found ]; then
    source /etc/bash.command-not-found
fi;

###############################################################################

# WARNING! THIS MUST REMAIN AT THE END OF THE FILE
# Because other scripts may overwrite the settings it needs, such as `PROMPT_COMMAND`
# https://iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# WARNING! THIS MUST REMAIN AT THE END OF THE FILE
# See why: https://github.com/zsh-users/zsh-syntax-highlighting#faq
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###############################################################################

# Now that everything is ready 

# Init starship theme
# https://starship.rs/guide/#%F0%9F%9A%80-installation
eval "$(starship init zsh)"

# Trigger a custom command
neofetch --ascii_distro android --color_blocks off