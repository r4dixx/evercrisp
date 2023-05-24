#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
evercrisp='git --git-dir=/Users/asikel/.evercrisp --work-tree=/Users/asikel/'

echo -e;
echo "${bold}EVERCRISP - STATUS${normal}"; echo -e;
$evercrisp status; echo -e;

echo "${bold}EVERCRISP - PULLING CHANGES${normal}"; echo -e;
$evercrisp pull; echo -e;

echo "${bold}EVERCRISP - UPDATING SUBMODULES${normal}"; echo -e;
$evercrisp submodule update --remote