#!/bin/bash

echo -e "[SERVER]"
cd $(dirname "$0")

./packages.sh
../common/zsh.sh