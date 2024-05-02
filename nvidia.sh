#!/bin/sh

echo "-------------------------------------------------"
echo "Peforming nVidia specific Installations"
echo "-------------------------------------------------"

echo "Copying mkinitcpio.conf"
cp -r files/mkinitcpio.conf $HOME/.dotconf
echo "Copying root.conf"
cp -r files/root.conf $HOME/.dotconf
echo "Copying nvidia.conf"
cp -r files/nvidia.conf $HOME/.dotconf#
echo "Copying environment"
cp -r files/environment $HOME/.dotconf

echo "-------------------------------------------------"
echo "Starting nVidia System Services"
echo "-------------------------------------------------"

sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

echo "-------------------------------------------------"
echo "Creating nVidia specific Symlinks"
echo "-------------------------------------------------"

sudo ln -sf $HOME/.dotconf/root.conf /etc/cmdline.d/
sudo ln -sf $HOME/.dotconf/nvidia.conf /etc/modprobe.d/
sudo ln -sf $HOME/.dotconf/environment /etc/
sudo ln -sf $HOME/.dotconf/mkinitcpio.conf /etc/