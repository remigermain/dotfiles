#!/bin/bash

if [[ $# != 1 ]]; then
    echo "you need to tell the os..."
    exit 0
fi

if [[ $1 == "fedora" ]]; then
    ./fedora/install.sh
elif [[ $1 == "server" ]]; then
    ./server/install.sh
else
    echo "wrong os..."
    exit 0
fi
