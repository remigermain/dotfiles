#!/bin/bash

# check os
os='debian'
if [[ $# != 0 ]]; then
	os=$1
fi

if [[ $os == 'debian' ]]; then
	sudo apt-get -y install build-essential curl file git ruby
elif [[ $os == 'fedora' ]]; then
	sudo dnf groupinstall -y 'Development Tools'
	sudo dnf install -y curl file git libxcrypt-compat ruby
else
	echo 'wrong os,  only debian and fedora allowed...'
	exit -1
fi

echo 'install brew...'
cat <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh) | bash

echo "Add Homebrew to $USER PATH..."
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> /home/$USER/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
source /home/$USER/.zsprofile
source /home/$USER/.zshrc
