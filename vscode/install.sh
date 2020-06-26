#!/bin/bash

# echo "Install vscodium..."
# flatpak install -y flathub com.vscodium.codium


mkdir -p /home/$USER/.config/VSCodium/
cp -r ./settings/* /home/$USER/.config/VSCodium/

$(cat extensions.txt | xargs -L 1 echo $(which codium) --install-extension)