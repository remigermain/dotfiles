#!/bin/bash

echo -e "[FEDORA]"
cd $(dirname "$0")

# ./packages.sh
# ./gnome.sh
# ./vscode.sh
# ../common/install.sh


# extra

echo "install quickchar..."
sudo cp -r ../tools/quickchar/quickchar /etc/rc.d
sudo cp -r ../tools/quickchar/org.app.quickchar.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
gsettings set org.app.quickchar enable-quickchar true