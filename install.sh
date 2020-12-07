#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

# Install some libraries, packages and nice software in general
sudo apt-get install gnome-tweaks build-essentialsoftware-properties-common -y

# Copy/paste from https://github.com/jules-ch/Ubuntu20-Setup-XPS13/blob/master/setup.sh
# Add dell drivers
sudo sh -c 'cat > /etc/apt/sources.list.d/focal-dell.list << EOF
deb http://dell.archive.canonical.com/updates/ focal-dell public
# deb-src http://dell.archive.canonical.com/updates/ focal-dell public
deb http://dell.archive.canonical.com/updates/ focal-oem public
# deb-src http://dell.archive.canonical.com/updates/ focal-oem public
deb http://dell.archive.canonical.com/updates/ focal-somerville public
# deb-src http://dell.archive.canonical.com/updates/ focal-somerville public
deb http://dell.archive.canonical.com/updates/ focal-somerville-melisa public
# deb-src http://dell.archive.canonical.com/updates focal-somerville-melisa public
EOF'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F9FDA6BED73CDC22

sudo apt update -qq

# Install drivers
sudo apt install oem-somerville-melisa-meta libfprint-2-tod1-goodix oem-somerville-meta tlp-config -y


# Show battery percentage on screen
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Suspend when closing the lid (laptop)
echo >> /etc/systemd/logind.conf
echo "HandleLidSwitch=suspend" >> /etc/systemd/logind.conf

# Minimise windows on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Shutter for taking screenshots
# Howto -> http://ubuntuhandbook.org/index.php/2018/08/printscreen-launch-shutter-area-selection-ubuntu-18-04/
sudo add-apt-repository -y ppa:linuxuprising/shutter -y > /dev/null 2>&1
sudo apt-get install shutter -y


# Add Plata-theme
sudo add-apt-repository ppa:tista/plata-theme -y > /dev/null 2>&1
sudo apt update -qq && sudo apt install plata-theme -y

gsettings set org.gnome.desktop.interface gtk-theme "Plata-Noir"
gsettings set org.gnome.desktop.wm.preferences theme "Plata-Noir"

# Enable Shell Theme

sudo apt install gnome-shell-extensions -y
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name "Plata-Noir"

sudo add-apt-repository ppa:system76/pop -y > /dev/null 2>&1
sudo apt update
sudo apt install pop-icon-theme

# Cleanup & Reboot
sudo apt update -qq && sudo apt upgrade -y && sudo apt autoremove -y

