#!/bin/bash

if [[ $# != 1 ]]; then
    echo "you need to tell the os..."
    exit 0
fi

if [[ $1 == "fedora" ]]; then
    ./fedora/install.sh
else
    echo "wrong os..."
    exit 0
fi
