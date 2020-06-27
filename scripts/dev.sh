#!/bin/bash

apps=(
    flatpak
    snapd
	git
	zsh
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
	java
	ruby
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}
