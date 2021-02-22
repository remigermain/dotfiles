#!/bin/bash

echo -e "\n[ZSH]"

echo "install oh my zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "link zshrc..."
rm -rf $HOME/.zshrc
ln -s $(pwd)/home/.zshrc $HOME/.zshrc


echo "link .vimrc..."
rm -rf $HOME/.vimrc
ln -s $(pwd)/home/.vimrc $HOME/.vimrc


echo "link scripts..."
ln -s  "$(pwd)/home/scripts" "$HOME/scripts" 
