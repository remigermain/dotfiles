#!/bin/bash


cd $(dirname $0)
source ./linked/.extra.zshrc

echo -e "\n[$(color-blue optimize gnome)]"


INSTALL=$1
REMOVE=$2

app=(
	abrt*
	libvirt*
	cheese
	totem totem-plugins
	gnome-weather
	gnome-photos
	simple-scan
	gnome-logs
	gnome-weather
	seahorse
	yelp
	gnome-tour
	gnome-system-monitor
)
echo "remove unnecessary gnome app..."
sudo $REMOVE ${app[@]}
#PackageKit gnome-software

app=(
	gnome-tweak-tool
	breeze-cursor-theme
	papirus-icon-theme
	wmctrl
)
echo "install gnome app..."
sudo $INSTALL ${app[@]}
mkdir -p $HOME/.themes

# settings gnome
gsettings set org.gnome.shell.app-switcher current-workspace-only true
