#!/bin/bash

# Install gnome desktop
sudo apt-get -y update
sudo apt-get -y upgrade
#sudo apt-get -y -q=2  install xfce4 xfce4-goodies
sudo apt-get -y -q=2  install ubuntu-gnome-desktop gnome-tweaks gnome-shell-extensions
sudo apt-get -y -q=2  install xrdp
sudo adduser xrdp ssl-cert
sudo apt-get -y -q=2  install ca-certificates curl apt-transport-https lsb-release gnupg

# Install Azure CLI
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update
sudo apt-get install azure-cli

# Install Azure SDK

# Install VS Code

# Install VS Code extentions?

# Install Terraform?

# 