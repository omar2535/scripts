#!/bin/bash

# Setup neovim
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Function to install Neovim if it's not installed
install_nvim() {
  echo "Neovim is not installed. Installing..."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim  # Make Neovim accessible via the nvim command
  echo "Neovim installation completed."
}

# Function to install fzf
install_fzf() {
  sudo apt-get install fzf
}

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
  install_nvim
else
  echo "Neovim is already installed. -- Skipping installation"
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  install_fzf
else
    echo "fzf already installed -- skipping installation"
fi

# Link nvim config directory
echo "Linking neovim config directory"
rm -rf ~/.config/nvim
mkdir -p ~/.config/
ln -s $SCRIPT_DIR/nvim ~/.config/

