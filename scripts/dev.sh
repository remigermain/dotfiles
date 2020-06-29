#!/bin/bash

apps=(
    flatpak
    snapd
	git
	zsh
	tmux
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
	jq
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}
