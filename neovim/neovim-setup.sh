#!/bin/bash

# Setup neovim
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

## Install neovim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# sudo rm -rf /opt/nvim
# sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Link nvim config directory
rm -rf ~/.config/nvim
mkdir -p ~/.config/
ln -s $SCRIPT_DIR/nvim ~/.config/

