#!/bin/bash

echo -e "\n[FLATPAK]"

echo "add repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

app=(
    com.github.tchx84.Flatseal
    com.slack.Slack
    com.discordapp.Discord
)

echo "install apps..."
flatpak install -y flathub ${app[@]}
