#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
#sudo apt-get -y -q=2  install xfce4 xfce4-goodies
sudo apt-get -y -q=2  install ubuntu-gnome-desktop gnome-tweaks gnome-shell-extensions
sudo apt-get -y -q=2  install xrdp
sudo adduser xrdp ssl-cert
sudo apt-get -y -q=2  install ca-certificates curl apt-transport-https lsb-release gnupg