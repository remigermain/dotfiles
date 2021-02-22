#!/bin/bash

function settings_ln () {
    echo "generate all link from $1..."

    mkdir -p $HOME/$1/
    apps=$(ls -1 ./home/$1)

    for app in ${apps[@]}; do
        rm -rf "$HOME/$1/$app"

        ln -s  "$(pwd)/home/$1/$app" "$HOME/$1/$app" 
        echo -e "\tlink $app..."
    done
}

settings_ln ".config"
