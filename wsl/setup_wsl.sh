#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Function to check and install a package if not present
install_if_missing_apt() {
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
install_if_missing_apt curl
install_if_missing_apt vim
install_if_missing_apt git
install_if_missing_apt tmux
install_if_missing_apt zsh
install_if_missing_apt pip3 python3-pip

# Build dependencies for pyenv
install_if_missing_apt make
install_if_missing_apt build-essential
install_if_missing_apt libssl-dev
install_if_missing_apt zlib1g-dev
install_if_missing_apt libbz2-dev
install_if_missing_apt libreadline-dev
install_if_missing_apt libsqlite3-dev
install_if_missing_apt wget
install_if_missing_apt llvm
install_if_missing_apt libncurses5-dev
install_if_missing_apt libncursesw5-dev
install_if_missing_apt xz-utils
install_if_missing_apt tk-dev
install_if_missing_apt libffi-dev
install_if_missing_apt liblzma-dev
install_if_missing_apt python3-openssl

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
