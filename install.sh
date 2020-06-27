#!/bin/bash

echo 'install zsh config...'
rm -rf /home/$USER/.zshrc
ln -s core/home/.zshrc /home/$USER/.zshrc

echo 'install vim config...'
rm -rf /home/$USER/.vimrc
ln -s core/home/.vimrc /home/$USER/.vimrc
