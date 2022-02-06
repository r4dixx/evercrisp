# Language setup
export LANG=en_US.UTF-8

# Local executables
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Oh My ZSH location
# https://github.com/ohmyzsh/ohmyzsh#custom-directory
export ZSH=$HOME/.oh-my-zsh

# Starship location
# https://starship.rs/fr-fr/config/#configuration
export STARSHIP_CONFIG=$HOME/.starship.toml

# Source Java home
# https://github.com/halcyon/asdf-java#java_home
. $HOME/.asdf/plugins/java/set-java-home.zsh

# Android command line variables
# https://developer.android.com/studio/command-line/variables
export ANDROID_SDK_ROOT=$HOME/Dev/Android/SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
