#!/bin/bash

echo -e "\n[COMMON]"
cd $(dirname "$0")

./flatpak.sh
./zsh.sh

echo "link .vimrc..."
rm -rf $HOME/.vimrc
ln -s $(pwd)/home/.vimrc $HOME/.vimrc


settings_ln () {
    echo "generate all link from $1..."

    apps=$(ls -1 ./home/$1)
    for app in ${apps[@]}; do
        rm -rf "$HOME/$1/$app"
        ln -s "$(pwd)/home/$1/$app/" "$HOME/$1/$app"
        echo -e "\tlink $app..."
    done
}

settings_ln ".config"

echo "config app..."
if [[ ! -d "$HOME/.config/ulauncher/user-themes/palenight" ]]; then
    git clone https://github.com/fsrocha-dev/ulauncher-palenight-theme.git $HOME/.config/ulauncher/user-themes/palenight
fi