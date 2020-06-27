#!/bin/bash

pwd=$(pwd)
echo 'install zsh config...'
rm -rf /home/$USER/.zshrc
ln -s $pwd/core/home/.zshrc /home/$USER/.zshrc

echo 'install vim config...'
rm -rf /home/$USER/.vimrc
ln -s $pwd/core/home/.vimrc /home/$USER/.vimrc
