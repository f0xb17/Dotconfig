#!/bin/sh

echo "-------------------------------------------------"
echo "Package Installation: Cinnamon"
echo "-------------------------------------------------"

sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-xapp xdg-desktop-portal-gtk gnome-software xarchiver cinnamon-translations
