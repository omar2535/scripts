#!/bin/bash

# Setup neovim
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Make sure python-venv is installed
sudo apt install -y python3-venv

# Function to install Neovim if it's not installed
install_nvim() {
  echo "Neovim is not installed. Installing..."
  if [  -n "$(cat /etc/os-release | grep Ubuntu)" ]; then
    sudo snap install nvim --classic
  else
    echo "Installing neovim manually -- operating system not supported"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim  # Make Neovim accessible via the nvim command
    echo "Neovim installation completed."
  fi
}

# Function to install fzf
install_fzf() {
  if [  -n "$(uname -a | grep Ubuntu)" ]; then
    sudo apt-get install fzf
  else
    echo "Install fzf manually -- operating system not supported"
  fi
}

install_luarocks() {
  if [  -n "$(uname -a | grep Ubuntu)" ]; then
    sudo apt-get install luarocks
  else
    echo "Install luarocks manually -- operating system not supported"
  fi
}

install_go() {
  if [  -n "$(uname -a | grep Ubuntu)" ]; then
    sudo snap install go  --classic
    go install -v golang.org/x/tools/gopls@latest
  else
    echo "Install luarocks manually -- operating system not supported"
  fi
}

install_pyright() {
  if [  -n "$(uname -a | grep Ubuntu)" ]; then
    sudo snap install pyright --classic
  else
    echo "Install luarocks manually -- operating system not supported"
  fi
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

# Check if luarocks is installed
if ! command -v luarocks &> /dev/null; then
  install_luarocks
else
    echo "luarocks already installed -- skipping installation"
fi

# Check if golang is installed
if ! command -v go &> /dev/null; then
  install_go
else
    echo "go already installed -- skipping installation"
fi

# Check if pyright is installed
if ! command -v pyright &> /dev/null; then
  install_pyright
else
    echo "pyright already installed -- skipping installation"
fi

# Link nvim config directory
echo "Linking neovim config directory"
rm -rf ~/.config/nvim
mkdir -p ~/.config/
ln -s $SCRIPT_DIR/nvim ~/.config/

