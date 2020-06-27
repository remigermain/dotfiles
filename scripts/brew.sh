#!/bin/bash

# check os
os='debian'
if [[ $# != 0 ]]; then
	os=$1
fi

if [[ $os == 'debian' ]]; then
	sudo apt-get -y install build-essential curl file git ruby
else if [[ $os == 'fedora' ]]; then
	sudo dnf -y groupinstall 'Development Tools'
	sudo dnf -y install curl file git install libxcrypt-compat ruby
else
	echo 'wrong os,  only debian and fedora allowed...'
	exit -1
fi

echo 'install brew...'
/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)'

echo 'Add Homebrew to $USER PATH...'
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/$USER/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
