#!/bin/sh

echo "-------------------------------------------------"
echo "Performing yay Installation"
echo "-------------------------------------------------"

git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd ../ && rm -rf yay