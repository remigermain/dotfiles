#!/bin/bash

echo "install oh my zsh..."
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/zsh.sh
bash -f /tmp/zsh.sh --unattended

echo "link zshrc..."
ln -s "../common/linked/.zshrc" "$HOME/.zshrc"

echo "link .vimrc..."
ln -s "../common/linked/.vimrc" "$HOME/.vimrc"