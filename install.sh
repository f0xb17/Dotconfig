#!/bin/sh

# Performing Systemupdate

echo "-------------------------------------------------"
echo "Performing Systemupdate"
echo "-------------------------------------------------"

sudo pacman -Syu

# ---------------------------------------------------------------------------

# Creating necessary files and folders

echo "-------------------------------------------------"
echo "Creating necessary files and folders"
echo "-------------------------------------------------"

echo "Creating .dotconf folder"
mkdir $HOME/.dotconf
echo "Creating /etc/cmdline.d/ folder"
sudo mkdir /etc/cmdline.d/

# ---------------------------------------------------------------------------

# Copy files to .dotconf location

./base-config.sh

# ---------------------------------------------------------------------------

# Desktop environment specific installation

if [[ "$1" == "--kde" ]]; then
    ./kde.sh
fi

if [[ "$1" == "--cinnamon" ]]; then
    ./cinnamon.sh
fi

if [[ "$1" == "--gnome" ]]; then
    ./gnome.sh
fi

if [[ "$1" == "--xfce" ]]; then
    ./xfce.sh
fi

# ---------------------------------------------------------------------------

# Installing base packages

./base.sh

# ---------------------------------------------------------------------------

# Installing oh-my-zsh

./zsh.sh

# ---------------------------------------------------------------------------

# Installing LazyVim

# ./lazy.sh

# ---------------------------------------------------------------------------

# Performing nVidia Specific Installation

./nvidia.sh

# ---------------------------------------------------------------------------

# Starting System Services

./services.sh

# ---------------------------------------------------------------------------

# Installing AUR Helper yay

./yay.sh

# ---------------------------------------------------------------------------

# Installing Software with Pacman

./pacman.sh

# ---------------------------------------------------------------------------

# Installing Software with Flatpak

./flatpak.sh

# ---------------------------------------------------------------------------

# Installing Software from the AUR.

./aur.sh

# ---------------------------------------------------------------------------

# Changing Folder Permissions

echo "-------------------------------------------------"
echo "Changing Folder Permissions"
echo "-------------------------------------------------"

echo "Changing folder Permission for visual-studio-code"
sudo chown -R $(whoami) /opt/visual-studio-code

# ---------------------------------------------------------------------------

# Cleaning

echo "-------------------------------------------------"
echo "Cleaning Caches"
echo "-------------------------------------------------"

yay -Scc
yay -Yc

# ---------------------------------------------------------------------------

# Finishing the Installation by deleting not needed Software. 

echo "----------------------------------"
echo "Finishing"
echo "----------------------------------"

sudo mkinitcpio -P

# ---------------------------------------------------------------------------

# Finishing the Installation by deleting not needed Software. 

echo "Installation finished. Performing reboot now?"
echo "Press enter to continue..."
read

reboot
