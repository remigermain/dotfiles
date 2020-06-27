#!/bin/bash

apps=(
	breeze-cursor-theme
	papirus-icon-theme
	wmctrl
	exif
)

CMD='apt install -y'

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}

echo 'Install theme...'
mkdir -p /home/$USER/.themes
link='https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTI2NTkwNTgiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjY4ZDEzMTIwNDJjNWFiODU5OTEwZDg0MGQ3NzlkMjBkOTYzZDY4NmZlYjdkODMxN2EzODU2NGE0N2IzZTcxM2M1NDdkMWI2YWNhMGVlOTk1NDYzZDI0YzAzNDhkOGZjMzJhOTQ5ZTk1OTAxMzMwNWI2NDk4NDEwMDVkZDljNDM3IiwidCI6MTU5MzMwMjc2Niwic3RmcCI6ImMzMTRkNzI2MDliODgxMjMxYzkxMzFlNzNiYzU4MTBhIiwic3RpcCI6IjJhMDE6ZTBhOjJkMToxYzAwOjEwYWQ6ZTQ6ZTNjNzo0NDIyIn0.hAXfAY0hiSrROkXvsoCH6V8wWB4lawx8qTtAGpdJ7sc/Layan-dark-20200620131332.tar.xz'
wget $link
tar xf Layan-dark-20200620131332.tar.xz -C /home/$USER/.themes/
rm -rf Layan-dark-20200620131332.tar.xz
