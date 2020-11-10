#!/bin/bash

echo -e "\n[ZSH]"

echo "install oh my zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "link zshrc..."
rm -rf $HOME/.zshrc
ln -s $(pwd)/home/.zshrc $HOME/.zshrc
