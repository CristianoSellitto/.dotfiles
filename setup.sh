#!/usr/bin/env bash
# Created by Cristiano Sellitto
# Creatd on 2024-02-14
# Setup script for Debian
# Make sure the files are in ~/.dotfiles

# Update computer
sudo apt update
sudo apt upgrade -y

# Install common programs
sudo apt remove w3m -y
sudo apt install git -y
git config --global user.email "cristiano.sellitto@mths.ca"
git config --global user.name "Cristiano Sellitto"
sudo apt install gh -y
sudo apt install tree -y
sudo apt install stow -y
cd ~/.dotfiles
stow .


# Install java linter
cd ~
sudo apt install wget -y
mkdir ~/scripts
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.13.0/checkstyle-10.13.0-all.jar
cp ./checkstyle-10.3.0-all.jar ~/scripts/checkstyle.jar
wget https://raw.githubusercontent.com/Mr-Coxall/dot_files/main/mr-coxall_checks.xml
cp ./mr-coxall_checks.xml ~/scripts/
rm checkstyle-10.3.0-all.jar
rm mr-coxall_checks.xml

# Install NeoVim from source
mkdir temp
cd temp
sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~
sudo rm -r ./temp
cp -r ./.dotfiles/.config/nvim/ ./.config/nvim

# Install programming languages
sudo apt install -y unzip
curl -fsSL https://bun.sh/install | bash
sudo apt install -y nodejs
sudo apt install -y npm
sudo npm i -g typescript-language-server
sudo npm i -g typescript
# bun add bun-promptx
sudo apt install -y default-jdk

# Reboot system
echo Trying to reboot...
sudo reboot now
