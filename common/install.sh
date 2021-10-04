#!/bin/bash

cd $(dirname "$0")

./config.sh

# install package
./packages/flatpak.sh
./packages/javascript.sh
./packages/python.sh
./packages/other.sh


./system.sh
./theme.sh
