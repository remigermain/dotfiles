#!/bin/bash

apps=(
	breeze-cursor-theme
	papirus-icon-theme
	wmctrl
	exif
)

CMD='apt install -y'

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}

echo 'Install theme...'
mkdir -p /home/$USER/.themes
tar xf Layan-dark-20200620131332.tar.xz -C /home/$USER/.themes/
rm -rf Layan-dark-20200620131332.tar.xz


mkdir -p /home/$USER/.config/ulauncher/user-themes

git clone https://github.com/fsrocha-dev/ulauncher-palenight-theme.git /home/$USER/.config/ulauncher/user-themes/palenight
