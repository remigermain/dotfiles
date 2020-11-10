#!/bin/bash

echo -e "\n[FLATPAK]"

echo "add repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "install flatseal..."
flatpak install -y flathub com.github.tchx84.Flatseal

echo "install slack..."
flatpak install -y flathub com.slack.Slack

echo "install discord..."
flatpak install -y flathub com.discordapp.Discord
