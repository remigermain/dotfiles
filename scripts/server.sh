#!/bin/bash

apps=(
    git
    vim
    zsh
    appache
    python3
    python3-venv
    npm
    curl
    sqlite3
    locales
    apache2
    libapache2-mod-wsgi
    libapache2-mod-wsgi-py3
    certbot
    python-certbot-apache
    fail2ban
    postfix
    opendkin
    opendmarc
)

CMD="apt install -y"

if [[ $# != 0 ]]; then
    CMD=$@
fi

echo "Install ${apps[@]}..."
sudo $CMD ${apps[@]}
