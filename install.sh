#!/bin/bash

cd $(dirname $0)
source common/linked/.extra.zshrc
origi=$(pwd)

color-blue "Dotfiles installations..."

if [[ $# == 0 ]]; then
    os=$(uname -n)
    echo "you haven't specified operaning system, we determined you are in $(color-underline $(color-blue $os))"
    read -p "want to continue ? (y/n): " -n 1 yn
    echo ""
    case $yn in
        "Y" | "y" | "yes")
        ;;
        "N" | "n" | "no")
            exit 0
        ;;
        *)
        echo "wrong value, only (y/n) accepted"
        echo "exit..."
        exit 1
        ;;
    esac
else
    os=$1
fi

if [[ $os == "fedora" ]]; then
    install="./fedora/install.sh"
elif [[ $os == "server" ]]; then
    install="./server/install.sh"
else
    echo "You can chose from fedora, server"
    exit 1
fi

if [[ $origi != $DOTFILE_PATH ]]; then
    echo "create workspaces folder..."
    mkdir -p $WORKSPACES_PATH

    echo "move dotfiles into workspaces..."
    rm -rf $DOTFILE_PATH
    mv $origi $DOTFILE_PATH
    cd $DOTFILE_PATH
fi

$install