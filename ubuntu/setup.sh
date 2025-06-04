#!/bin/bash

sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y git
sudo apt-get install -y tmux
sudo apt-get install -y zsh
sudo apt-get install -y python3-pip

sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
curl https://pyenv.run | bash

# Install go
sudo snap install go  --classic

