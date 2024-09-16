#!/bin/sh

echo "-------------------------------------------------"
echo "Installing Base Packages"
echo "-------------------------------------------------"

# Deleting vim because we want to install nvim later
sudo pacman -Rcns vim

packages=(
    "git"
    "base-devel"
    "bluez"
    "bluez-utils"
    "cups"
    "cups-pdf"
    "zsh"
    "which"
    "github-cli"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    "fzf"
    "ufw"
    "zoxide"
    "exa"
    "unrar"
    "unzip"
    "zip"
    "p7zip"
    "libheif"
    "ntfs-3g"
    "fastfetch"
    "zlib"
    "zenity"
    "zxing-cpp"
    "xvidcore"
    "xwaylandvideobridge"
    "xorg-xwayland"
    "wget"
    "whois"
    "usbutils"
    "aspell"
    "aspell-de"
    "earlyoom"
    "rsync"
    "reflector"
    "bat"
)

for package in "${packages[@]}"; do
    echo "----------------------------------"
    echo "Installing package: $package"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${package}
done
