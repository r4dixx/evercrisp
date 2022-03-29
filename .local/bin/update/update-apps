#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo -e;
echo "${bold}MAC - APP STORE${normal}"; echo -e;
echo "The following apps are outdated:";
mas outdated; echo -e;
echo "Upgrading..."; echo -e;
mas upgrade; echo -e;

echo "${bold}HOMEBREW${normal}"; echo -e;
echo "Updating package definitions (and homebrew itself)..."; echo -e;
brew update;

echo "${bold}HOMEBREW - PACKAGES${normal}"; echo -e;
echo "Upgrading everything..."; echo -e;
brew upgrade

