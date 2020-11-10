#!/bin/bash

echo -e "\n[GNOME]"

echo "remove unnecessary app..."
sudo dnf autoremove -y abrt*
sudo dnf autoremove -y libvirt*
sudo dnf autoremove -y cheese
sudo dnf autoremove -y totem totem-plugins
sudo dnf autoremove -y gnome-weather
sudo dnf autoremove -y gnome-photos
sudo dnf autoremove -y simple-scan
sudo dnf autoremove -y gnome-logs
sudo dnf autoremove -y gnome-weather
sudo dnf autoremove -y seahorse
#sudo dnf autoremove -y PackageKit gnome-software

echo "install gnome tweaks tools..."
sudo dnf install -y gnome-tweak-tool

echo "install themes..."
app=(
	breeze-cursor-theme
	papirus-icon-theme
	wmctrl
)
sudo dnf install -y ${app[@]}
mkdir -p $HOME/.themes

# settings gnome
gsettings set org.gnome.shell.app-switcher current-workspace-only true