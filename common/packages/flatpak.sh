#!/bin/bash

#*******************************
#          flatpak
#*******************************

cd $(dirname $0)
source ../linked/.extra.zshrc

echo -e "\n[$(color-blue install flatpak packages)]"


echo "add flathub repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

app=(
    com.github.tchx84.Flatseal
    com.slack.Slack
    com.discordapp.Discord
    com.github.vladimiry.ElectronMail
    im.riot.Riot
    io.freetubeapp.FreeTube
)

echo "install apps..."
flatpak install -y flathub ${app[@]}