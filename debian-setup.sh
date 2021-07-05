#!/bin/bash

# Install some packages that I use
sudo apt-get install zsh curl vim tmux;

# Install chrome
echo -e "\e[91mInstalling chrome";
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Downloads/google-chrome-stable-stable_current_amd64.deb;
cd ~/Downloads && sudo apt install ./google-chrome-stable_current_amd64.deb;
