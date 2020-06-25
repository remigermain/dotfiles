#!/bin/bash

echo "Upgrade pip..."
sudo python3 -m pip install --upgrade pip

echo "Link snapd app..."
sudo ln -s /var/lib/snapd/desktop/applications /usr/share/applications/snapd