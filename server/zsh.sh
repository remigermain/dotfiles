#!/bin/bash

cd $(dirname $0)
source ../common/linked/.extra.zshrc

echo -e "\n[$(color-blue intisalize config)]"

function link-config () {
    from=$1
    to=$2
    rm -rf $to
    ln -s $from $to
}

echo "create workspaces folder..."
mkdir -p $BASE_DIR_PATH
mkdir -p $APP_PATH
mkdir -p $BIN_PATH
mkdir -p $WORKSPACES_PATH

echo "install oh my zsh..."
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/zsh.sh
bash -f /tmp/zsh.sh --unattended
rm -rf /tmp/zsh.sh

LINKED="$(dirname $(pwd))/common/linked"
echo "link zshrc..."
link-config "$LINKED/.zshrc" "$HOME/.zshrc"
link-config "$LINKED/.extra.zshrc" "$HOME/.extra.zshrc"

echo "link .vimrc..."
link-config "$LINKED/.vimrc" "$HOME/.vimrc"

echo "link scripts..."
link-config "$LINKED/scripts" $SCRIPTS_PATH

echo "git config..."
git config --add user.name rgermain
git config --add user.email germain.remi@protonmail.com