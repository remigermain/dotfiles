#!/bin/bash

echo -e "\ninstall for server..."
cd $(dirname "$0")

./packages.sh
./zsh.sh