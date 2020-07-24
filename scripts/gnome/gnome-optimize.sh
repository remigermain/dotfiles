#!/bin/bash

CMD="apt autoremove -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Remove unnecessary app..."
sudo $CMD abrt*
sudo $CMD libvirt*
sudo $CMD cheese
sudo $CMD totem totem-plugins
sudo $CMD gnome-weather
#sudo $CMD PackageKit gnome-software
sudo $CMD gnome-photos
sudo $CMD simple-scan
sudo $CMD gnome-logs
sudo $CMD gnome-weather
sudo $CMD seahorse

echo "Install gnome tweaks tools..."
sudo $CMD gnome-tweak-tool
