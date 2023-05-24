#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo -e;
echo "${bold}RUBYGEMS${normal}"; echo -e;
echo "Updating..."; echo -e;
gem update --system; echo -e;

echo "${bold}RUBYGEMS - PACKAGES${normal}"; echo -e;
echo "The following packages are outdated:";
gem outdated; echo -e;
gem update
