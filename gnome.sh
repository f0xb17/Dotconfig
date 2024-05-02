#!/bin/sh

echo "-------------------------------------------------"
echo "Package Installation: Gnome"
echo "-------------------------------------------------"

sudo pacman -S --needed --noconfirm eog ghex gnome-boxes

echo "-------------------------------------------------"
    echo "Removing: Standard Packages from Gnome (need to confirm this)"
    echo "-------------------------------------------------"

    sudo pacman -Rcns gnome-music totem yelp gnome-contacts gnome-clocks gnome-maps gnome-weather epiphany