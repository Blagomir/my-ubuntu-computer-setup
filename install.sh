#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

# Show battery percentage on screen
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Suspend when closing the lid (laptop)
echo >> /etc/systemd/logind.conf
echo "HandleLidSwitch=suspend" >> /etc/systemd/logind.conf