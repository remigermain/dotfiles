#!/bin/bash



echo "config app..."
rm -rf  "$HOME/.config/ulauncher/user-themes/palenight"
git clone https://github.com/fsrocha-dev/ulauncher-palenight-theme.git $HOME/.config/ulauncher/user-themes/palenight
