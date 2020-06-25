#!/bin/bash

apps=(
    flatpak
    snapd
	git
	zsh
	terminator
	vim
 	zsh
    curl
    valgrind
    sudo
    tree
    net-tools
    powerline
    adb
    nodejs
    htop
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}"
sudo $CMD ${apps[@]}
