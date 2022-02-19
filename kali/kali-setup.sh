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

    echo -e "\e[96mRemember to run \e[4msource ~/.zshrc\e[0m\e[96m if any plugins were installed"
}


# Function for server setup
server_setup() {
    # Check for server directory
    if [ -d ~/server ]; then
        echo -e "\e[92mServer directory already created, Skipping";
    else 
        echo -e "\e[91mCreating server directory at home";
        mkdir ~/server;
    fi

    echo -e "\e[39mDownloading files"

    # Direct files
    wget -q --show-progress "https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe" -O ~/server/JuicyPotato.exe
    wget -q --show-progress "https://github.com/ivanitlearning/Juicy-Potato-x86/releases/download/1.2/Juicy.Potato.x86.exe" -O ~/server/JuicyPotatox86.exe
    wget -q --show-progress "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASbat/winPEAS.bat" -O ~/server/winpeas.bat
    wget -q --show-progress "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/x64/Release/winPEAS.exe" -O ~/server/winpeas.exe
    wget -q --show-progress "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/x86/Release/winPEAS.exe" -O ~/server/winpeasx86.exe
    wget -q --show-progress "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASany.exe" -O ~/server/winpeasany.exe
    wget -q --show-progress "https://github.com/rebootuser/LinEnum/raw/master/LinEnum.sh" -O ~/server/linenum.sh
    wget -q --show-progress "https://github.com/jondonas/linux-exploit-suggester-2/raw/master/linux-exploit-suggester-2.pl" -O ~/server/linux-exploit-suggester-2.pl
    wget -q --show-progress "https://github.com/mzet-/linux-exploit-suggester/raw/master/linux-exploit-suggester.sh" -O ~/server/linux-exploit-suggester.sh
    wget -q --show-progress "https://github.com/sleventyeleven/linuxprivchecker/raw/master/linuxprivchecker.py" -O ~/server/linuxprivchecker.py
    wget -q --show-progress "https://github.com/Dhayalanb/windows-php-reverse-shell/raw/master/Reverse%20Shell.php" -O ~/server/windows-php-reverse-shell.php
    wget -q --show-progress "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64" -O ~/server/pspy64
    wget -q --show-progress "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32" -O ~/server/pspy32
    wget -q --show-progress "https://github.com/Anon-Exploiter/SUID3NUM/blob/master/suid3num.py" -O ~/server/suid3num.py
    wget -q --show-progress "https://github.com/pentestmonkey/unix-privesc-check/raw/master/upc.sh" -O ~/server/unix-privesc-check.sh
    wget -q --show-progress "https://github.com/besimorhino/powercat/raw/master/powercat.ps1" -O ~/server/powercat.ps1
    wget -q --show-progress "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh" -O ~/server/lse.sh
    wget -q --show-progress "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/linPEAS/linpeas.sh" -O ~/server/linpeas.sh
    wget -q --show-progress "https://github.com/PowerShellEmpire/PowerTools/raw/master/PowerUp/PowerUp.ps1" -O ~/server/powerup.ps1
    wget -q --show-progress "https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/SharpUp.exe" -O ~/server/sharpup.exe
    wget -q --show-progress "https://github.com/ankh2054/windows-pentest/raw/master/Privelege/accesschk-2003-xp.exe" -O ~/server/accesschk-2003-xp.exe
    wget -q --show-progress "https://github.com/ankh2054/windows-pentest/raw/master/Privelege/accesschk-2008-vista.exe" -O ~/server/accesschk-2008-vista.exe


    # Wordpress shell plugin
    wget -q --show-progress "https://github.com/Laceratus/wp-shell-plugin/raw/master/wp-shell-plugin.php" -O ~/server/wp-shell-plugin.php
    zip ~/server/wp-shell-plugin.zip ~/server/wp-shell-plugin.php

    # Zip files
    wget -q --show-progress "https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20200715/mimikatz_trunk.zip" -O ~/server/mimikatz.zip
    wget -q --show-progress "https://download.sysinternals.com/files/PSTools.zip" -O ~/server/PSTools.zip
    unzip ~/server/PSTools.zip -d ~/server/pstools
    unzip ~/server/mimikatz.zip -d ~/server/mimikatz
    rm ~/server/PSTools.zip
    rm ~/server/mimikatz.zip


    # Already installed on kali
    sudo cp /usr/bin/nc ~/server/
    cp /usr/share/windows-binaries/nc.exe ~/server/
    cp /usr/share/windows-binaries/wget -q --show-progress.exe ~/server/
    cp /usr/share/webshells/perl/perl-reverse-shell.pl ~/server/
    cp /usr/share/webshells/php/php-reverse-shell.php ~/server/
    cp /usr/share/webshells/php/simple-backdoor.php ~/server/

    # Change all permissions
    chmod +x ~/server/*

    echo -e "\e[96mServer scripts succesfully installed!"
}


# function for tools setup
tools_setup() {
    # Check for tools directory
    if [ -d ~/tools ]; then
        echo -e "\e[92mtools directory already created, Skipping";
    else 
        echo -e "\e[91mCreating tools directory at home";
        mkdir ~/tools;
    fi

    echo -e "\e[39mDownloading files"

    # clone a few tools to the tools directory
    echo -e "\e[94mCloning a few tools in the tools directory"
    git clone https://github.com/droope/droopescan.git ~/tools/droopescan
    git clone https://github.com/rezasp/joomscan.git ~/tools/joomscan
    git clone https://github.com/ajohnston9/snmpenum.git ~/tools/snmpenum
    git clone https://github.com/quentinhardy/odat.git ~/tools/odat
    git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch
    git clone https://github.com/pentestmonkey/smtp-user-enum.git ~/tools/smtp-user-enum
    git clone https://github.com/21y4d/nmapAutomator.git ~/tools/nmapAutomator
    git clone https://github.com/bonsaiviking/NfSpy.git ~/tools/NfSpy
    git clone https://github.com/jondonas/linux-exploit-suggester-2.git ~/tools/linux-exploit-suggester-2
    git clone https://github.com/SecureAuthCorp/impacket.git ~/tools/impacket
    git clone https://github.com/Neohapsis/creddump7.git ~/tools/creddump7
    git clone https://github.com/slimm609/checksec.sh.git ~/tools/checksec
    git clone https://github.com/longld/peda.git ~/tools/peda

    # permission changing before sym linking
    echo -e "\e[94mChaning a few file permissions"
    chmod +x ~/tools/nmapAutomator/nmapAutomator.sh

    # link a few binaries
    echo -e "\e[94mLinking a few binaries"
    sudo ln -s ~/tools/odat/odat.py /usr/local/bin/odat
    sudo ln -s ~/tools/snmpenum/snmpenum.pl /usr/local/bin/snmpenum
    sudo ln -s ~/tools/nmapAutomator/nmapAutomator.sh /usr/local/bin/nmapAutomator
    sudo ln -s ~/tools/linux-exploit-suggester-2/linux-exploit-suggester-2.pl /usr/local/bin/linux-exploit-suggester-2
    sudo ln -s ~/tools/checksec/checksec /usr/local/bin/checksec
    
    # install apt packages
    echo -e "\e[94mInstalling a few apt packages"
    sudo apt-get install smtp-user-enum
    sudo apt-get install wkhtmltopdf
    sudo apt-get install sipvicious
    sudo apt-get install tnscmd10g
    sudo apt-get install gobuster
    sudo apt-get install jd-gui
    sudo apt install seclists
    sudo apt install gdb

    # install autorecon from python pip
    echo -e "\e[94mInstalling autorecon"
    sudo apt install python3-pip
    git clone https://github.com/Tib3rius/AutoRecon.git -O ~/tools/autorecon
    python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
    sudo ln -s ~/tools/autorecon//src/autorecon/autorecon.py /usr/bin/autorecon

    # install using pip
    echo -e "\e[94mInstalling impacket"
    pip install ~/tools/impacket/

    # install postman
    echo -e "\e[94mInstalling postman"
    wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman-linux-x64.tar.gz
    sudo tar -xzf /tmp/postman-linux-x64.tar.gz -C /opt
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

    # install chrome
    echo -e "\e[94mInstalling chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome_amd64.deb
    sudo apt install gdebi-core
    gdebi /tmp/chrome_amd64.deb

    # link peda
    echo "source ~/tools/peda/peda.py" >> ~/.gdbinit

    # Install ffuf
    sudo apt-get install -y golang
    go get -u github.com/ffuf/ffuf

    # Install RevShellGen
    git clone https://github.com/t0thkr1s/revshellgen -O ~/tools/revshellgen
    sudo python3 ~/tools/revshellgen/setup.py install
}

# ENTRY POINT OF SCRIPT
echo -n -e "\e[94mRun ZSH install scripts? [Y/n]?"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -n -e "\e[96mRunning oh_my_zsh_setup";
    oh_my_zsh_setup
else
    echo -e "\e[95mSkipping oh_my_zsh_setup";
fi

echo -n -e "\e[94mRun server scripts (creates server directory and loads with pentest tools)? [Y/n]?"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -n -e "\e[96mRunning server setup";
    server_setup
else
    echo -e "\e[95mSkipping server setup";
fi

echo -n -e "\e[94mRun tools setup? [Y/n]?"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -n -e "\e[96mRunning tools setup";
    tools_setup
else
    echo -e "\e[95mSkipping tools setup";
fi

echo -e "\e[95mCleaning up";
sudo apt autoremove;
