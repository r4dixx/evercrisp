#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo -e;
echo "${bold}VIM - PLUGINS${normal}"; echo -e;
echo "Upgrading vim-plug...";
vim +PlugUpgrade +qall;
echo "Updating Vim plugins...";
vim +PlugUpdate +qall
