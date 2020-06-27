#!/bin/bash

# echo "Install vscodium..."
# flatpak install -y flathub com.vscodium.codium

pwd=$(pwd)

echo "link settings vscode..."
mkdir -p /home/$USER/.config/VSCodium/
rm -rf /home/$USER/.config/VSCodium/User/
ln -s $pwd/settings/User /home/$USER/.config/VSCodium/

echo "install extensions..."
$(cat extensions.txt | xargs -L 1 echo $(which codium) --install-extension)
