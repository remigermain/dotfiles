#!/bin/bash

apps=(
	papirus-icon-theme
	wmctrl
	exif
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}"
sudo $CMD ${apps[@]}
