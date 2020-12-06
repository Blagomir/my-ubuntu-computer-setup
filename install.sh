#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

# Install some libraries, packages and nice software in general
sudo apt-get install gnome-tweaks


# Show battery percentage on screen
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Suspend when closing the lid (laptop)
echo >> /etc/systemd/logind.conf
echo "HandleLidSwitch=suspend" >> /etc/systemd/logind.conf

# Minimise windows on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'