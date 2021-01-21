#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[91m"
NORMAL="\e[0m"
SUCCSESS="$GREEN Success! $NORMAL"
FAIL="$RED Failed ... $NORMAL"


# Install Gnome desktop
echo -e "$YELLOW Installing Gnome desktop! $NORMAL"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y -q=2  install ubuntu-gnome-desktop gnome-tweaks gnome-shell-extensions
sudo apt-get -y -q=2  install xrdp
sudo adduser xrdp ssl-cert
sudo apt-get -y -q=2  install ca-certificates curl apt-transport-https lsb-release gnupg

echo -e "$YELLOW Trying to install Azure CLI! $NORMAL"
if command -v az > /dev/null 2>&1; then
  echo -e "$GREEN az CLI exists! Skipping installation. $NORMAL"
else
    echo -e "$YELLOW Installing Azure CLI $NORMAL"
    sudo apt-get update
    sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor |
        sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
        sudo tee /etc/apt/sources.list.d/azure-cli.list
    sudo apt-get -y update
    sudo apt-get -y install azure-cli && echo -e $SUCCSESS || echo -e $FAIL
    echo -e "$GREEN Done installing Azure CLI! $NORMAL"
fi
