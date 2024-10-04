#!/bin/bash

# Function for zsh setup
oh_my_zsh_setup() {
    # Check for zsh
    if [[ $(which zsh) ]]; then
        echo -e "\e[92mzsh is installed, skipping";
    else
        echo -e "\e[91mInstalling zsh";
        sudo apt install zsh;
        echo -e "\e[95mChanging shell for current user to zsh"
        chsh -s $(which zsh);
    fi

    # Check for oh-my-zsh

    if [ -d ~/.oh-my-zsh ]; then
        echo -e "\e[92mOh-my-zsh installed, Skipping";
    else
        echo -e "\e[91mInstalling oh-my-zsh";
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
    fi

    # Check for zsh-autosuggestions
    if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
        echo -e "\e[92mzsh autosuggestions installed, Skipping";
    else
        echo -e "\e[91mInstalling zsh-autosuggestions";
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
        sed -i -e 's/plugins=(/plugins=(zsh-autosuggestions /1' ~/.zshrc;
    fi

    # Check for zsh-syntax-highlighting
    if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
        echo -e "\e[92mzsh-syntax-highlighting installed, Skipping";
    else
        echo -e "\e[91mInstalling zsh-syntax-highlighting";
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        sed -i -e 's/plugins=(/plugins=(zsh-syntax-highlighting /1' ~/.zshrc;
    fi

    # Install powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    echo -e "\e[96mRemember to run \e[4msource ~/.zshrc\e[0m\e[96m if any plugins were installed"
}

oh_my_zsh_setup;