#!/bin/bash

echo "Add repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Install flatseal..."
flatpak install -y flathub com.github.tchx84.Flatseal

echo "Install slack..."
flatpak install -y flathub com.slack.Slack

echo "Install discord..."
flatpak install -y flathub com.discordapp.Discord

echo "Install vlc..."
flatpak install -y flathub org.videolan.VLC

echo "Install inkscape..."
flatpak install -y flathub org.inkscape.Inkscape

echo "Install krita..."
flatpak install -y flathub org.kde.krita

echo "Install keePassXc..."
flatpak install -y flathub org.keepassxc.KeePassXC

echo "Install transmission..."
flatpak install -y flathub com.transmissionbt.Transmission