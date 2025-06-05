#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Function to check and install a package if not present
install_if_missing() {
    local cmd=$1
    local pkg=${2:-$1}

    # Check if this is a binary (like git) or a package (like libssl-dev)
    if dpkg -s "$pkg" &> /dev/null; then
        echo "$pkg is already installed."
    elif command -v "$cmd" &> /dev/null; then
        echo "$pkg is already installed (via binary check)."
    else
        echo "Installing $pkg..."
        sudo apt-get install -y "$pkg"
    fi
}

# Essential CLI tools
install_if_missing curl
install_if_missing vim
install_if_missing git
install_if_missing tmux
install_if_missing zsh
install_if_missing pip3 python3-pip

# Build dependencies for pyenv
install_if_missing make
install_if_missing build-essential
install_if_missing libssl-dev
install_if_missing zlib1g-dev
install_if_missing libbz2-dev
install_if_missing libreadline-dev
install_if_missing libsqlite3-dev
install_if_missing wget
install_if_missing llvm
install_if_missing libncurses5-dev
install_if_missing libncursesw5-dev
install_if_missing xz-utils
install_if_missing tk-dev
install_if_missing libffi-dev
install_if_missing liblzma-dev
install_if_missing python3-openssl

# Install pyenv if not installed or if it's linking to a Windows path
if ! command -v pyenv &> /dev/null || [[ "$(command -v pyenv)" == /mnt/c/* ]]; then
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
else
    echo "pyenv is already installed and correctly linked."
fi

# Setup .zshrc safely
if [ -f ~/.zshrc ]; then
    echo "Backing up existing ~/.zshrc to ~/.zshrc.bak"
    cp ~/.zshrc ~/.zshrc.bak
fi

echo "Copying .zshrc from $SCRIPT_DIR to ~/.zshrc"
cp "$SCRIPT_DIR/.zshrc" ~/.zshrc

echo "Done. Restart your shell or run 'exec zsh' to use the new configuration."
