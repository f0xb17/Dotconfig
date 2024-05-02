#!/bin/sh

# Starting System Services

echo "-------------------------------------------------"
echo "Starting System Services"
echo "-------------------------------------------------"

# Printer Service
sudo systemctl enable cups.service
sudo systemctl enable cups.socket
sudo systemctl start cups.service

# Bluetooth Service
modprobe btusb
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Firewall Service
sudo ufw default reject
sudo ufw enable
sudo systemctl enable ufw.service