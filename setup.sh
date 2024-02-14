#!/usr/bin/env bash
# Created by Cristiano Sellitto
# Creatd on 2024-02-14
# Setup script for Debian

# Update computer
sudo apt update
sudo apt upgrade -y

# Install common programs
sudo apt remove w3m -y
sudo apt install git -y
sudo apt install gh -y
sudo apt install stow -y
stow .

# Install NeoVim from source
cd ~
mkdir temp
cd temp
sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~
sudo rm -r ./temp

# Install programming languages
sudo apt install unzip
curl -fsSL https://bun.sh/install | bash
sudo pat install -y default-jdk

# Create folders
mkdir ~/ICS4U
mkdir ~/ICS4U/Unit1

# Reboot system
echo Trying to reboot...
sudo reboot now
