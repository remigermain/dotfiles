#!/bin/bash


cd $(dirname $0)
source ./linked/.extra.zshrc

echo -e "\n[$(color-blue install themes)]"

echo "install ulauncher themes..."
ULAUN_PATH="$HOME/.config/ulauncher"
mkdir -p "$ULAUN_PATH/user-themes"
git clone https://github.com/fsrocha-dev/ulauncher-palenight-theme.git "$ULAUN_PATH/user-themes/palenight"

echo "install system themes..."
to="/tmp/Layan-gtk-theme"
rm -rf $to
git clone https://github.com/vinceliuice/Layan-gtk-theme.git $to
chmod +x "$to/install.sh"
"$to/install.sh"

to="/tmp/Tela-icon-themes"
rm -rf $to
git clone https://github.com/vinceliuice/Tela-icon-theme.git $to
chmod +x "$to/install.sh"
"$to/install.sh"

theme="Layan-dark"
if [[ $DESKTOP_SESSION == "gnome" ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme $theme
    gsettings set org.gnome.desktop.wm.preferences theme $theme
fi
