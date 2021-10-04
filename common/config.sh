#!/bin/bash

#*******************************
#          config
#*******************************

cd $(dirname $0)
source linked/.extra.zshrc

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

LINKED="$(pwd)/linked"
echo "link zshrc..."
link-config "$LINKED/.zshrc" "$HOME/.zshrc"
link-config "$LINKED/.extra.zshrc" "$HOME/.extra.zshrc"

echo "link .vimrc..."
link-config "$LINKED/.vimrc" "$HOME/.vimrc"

echo "link scripts..."
link-config "$LINKED/scripts" $SCRIPTS_PATH

echo "link config app..."
link-config "$LINKED/keepassxc" "$HOME/.config/keepassxc"
link-config "$LINKED/terminator" "$HOME/.config/terminator"
rm -rf "$HOME/.local/share/ulauncher"
link-config "$LINKED/ulauncher" "$HOME/.config/ulauncher"
link-config "$LINKED/valgrind" "$HOME/.config/valgrind"
link-config "$LINKED/kritadisplayrc" "$HOME/.config/kritadisplayrc"
link-config "$LINKED/kritarc" "$HOME/.config/kritarc"
link-config "$LINKED/nautiterm.yml" "$HOME/.config/nautiterm.yml"
link-config "$LINKED/nautilus" "$HOME/.local/share/nautilus"
link-config "$LINKED/nautilus-python" "$HOME/.local/share/nautilus-python"

echo "chmod ssh..."
mkdir -p ~/.ssh ~/.cache/ssh
chmod 700 ~/.ssh ~/.cache/ssh

echo "generate ssh key..."
ssh-keygen -f   "$HOME/.ssh/github" -q -N ""
ssh-keygen -f   "$HOME/.ssh/gitlab" -q -N ""

echo "git config..."
git config --add user.name rgermain
git config --add user.email germain.remi@protonmail.com

echo "link codium config..."
link-config "$LINKED/codium/User" "$HOME/.config/VSCodium/User"
echo "install codium extensions..."
lst=($(cat "$LINKED/codium/extensions.txt"))
codium=$(which codium)
for ext in ${lst[@]}; do
    s="$s --install-extension $ext"
done
codium --force $s 1>/dev/null