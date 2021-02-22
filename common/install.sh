#!/bin/bash

echo -e "\n[COMMON]"
cd $(dirname "$0")

./flatpak.sh
./zsh.sh
./python_package.sh
./config.sh
./themes.sh
