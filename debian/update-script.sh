# update chrome
echo -e "\e[91mInstalling chrome";
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Downloads/google-chrome-stable-stable_current_amd64.deb;
sudo apt install ~/.Downloads/google-chrome-stable_current_amd64.deb;

# update vscode
echo -e "\e[91mInstalling visual studio code";
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O ~/Downloads/vscode-stable_current_amd64.deb;
sudo apt install ~/.Downloads/vscode-stable_current_amd64.deb;

