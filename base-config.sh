#!/bin/sh

# Writing Configuration

echo "-------------------------------------------------"
echo "Copying configuration files"
echo "-------------------------------------------------"

echo "Copying makepkg.conf"
cp -r files/makepkg.conf $HOME/.dotconf/
sudo ln -sf $HOME/.dotconf/makepkg.conf /etc/
