#!/bin/bash

cd $(dirname $0)
source ./linked/.extra.zshrc

echo -e "\n[$(color-blue install system config)]"

SYS_PATH="system"

echo "install grub config..."
sudo cp -r "./$SYS_PATH/grub/grub" "/etc/default/grub"
sudo cp -r "./$SYS_PATH/grub/themes" "/boot/grub2/temes"

function has_command() {
  command -v $1 > /dev/null
}

echo "update grub..."
if has_command update-grub; then
    update-grub
elif has_command grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
elif has_command grub2-mkconfig; then
    if has_command zypper; then
        grub2-mkconfig -o /boot/grub2/grub.cfg
    elif has_command dnf; then
        grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
    fi
fi

echo "install system config..."
sudo rm -rf "/etc/sysctl.conf"
sudo ln -s "$(pwd)/$SYS_PATH/sysctl.conf" "/etc/sysctl.conf"
