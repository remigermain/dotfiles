#!/bin/bash

pwd=$(pwd)
echo 'install zsh config...'
rm -rf $HOME/.zshrc
ln -s $pwd/core/home/.zshrc $HOME/.zshrc

echo 'install vim config...'
rm -rf $HOME/.vimrc
ln -s $pwd/core/home/.vimrc $HOME/.vimrc

source $HOME/.zshrc
