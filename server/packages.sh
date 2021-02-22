#!/bin/bash

echo -e "\n[PACKAGES]"

app=(
    #ops
    git
    zsh
    tmux
    vim
    zsh
    curl
    sudo
    tree
    docker
    docker-compose

    # tools
    htop

    # language
    python3

    # lib
    jq

    # secu
)

echo "install ${apps[@]}..."
sudo apt install -y ${app[@]}


# docker
sudo systemctl enable docker
# add current user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

echo "upgrade pip..."
sudo python3 -m pip install --upgrade pip