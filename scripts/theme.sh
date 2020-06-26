#!/bin/bash

apps=(
	breeze-cursor-theme
	papirus-icon-theme
	wmctrl
	exif
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}

echo "Install theme..."
mkdir -p /home/$USER/.themes
link="https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTI2NTkwNTgiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjIwMWQ4ZGJlZGMzNzJjNjFlMGZjNTFiZWI0Yzc0M2YxYTE1MjI5ODgyYWJiM2JmOTVjZjlmNjk5ZWQ5OWE1YzllNWNjMWQ2NjQ4ZWEzYmNkZTM1M2Q3YWIzOTBmNWJjYWQ3MzEwZmUxNjYyNmQ0YmE2ZTYzZjFkYmIzMGZlODA3IiwidCI6MTU5MzE2OTUzNCwic3RmcCI6ImI0YzdmNDllZjFiYWM1OGQxYTNjZmQ2MzU2NWFiNTdlIiwic3RpcCI6IjJhMDE6ZTBhOjJkMToxYzAwOmQ1ZTY6YjQwZDo1YTAwOmI0ZDYifQ.wC5gjDPe8rCHY6_zR57EHG3B6iGtZRbtdP9s4bYoBGk/Layan-dark-20200620131332.tar.xz"
wget $link
tar xf Layan-dark-20200620131332.tar.xz -C /home/$USER/.themes/
rm -rf Layan-dark-20200620131332.tar.xz
