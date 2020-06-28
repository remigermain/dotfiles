#!/bin/bash

CMD="apt autoremove -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "install gnome tweak..."
sudo $CMD gnome-tweaks

echo "install extentions..."
./extensions.sh -e -f list.txt
