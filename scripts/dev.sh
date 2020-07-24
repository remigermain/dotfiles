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
	python3
	python3-venv
    valgrind
    sudo
    tree
    net-tools
    powerline
    adb
    nodejs
    htop
	openjdk-8-jdk
	ruby
	jq
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}
