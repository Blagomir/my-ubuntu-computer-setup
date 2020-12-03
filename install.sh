#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

# Show battery percentage on screen
gsettings set org.gnome.desktop.interface show-battery-percentage true