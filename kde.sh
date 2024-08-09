#!/bin/sh

echo "-------------------------------------------------"
echo "Package Installation: KDE Plasma"
echo "-------------------------------------------------"

sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-kde xdg-desktop-portal-gtk okular spectacle kcalc gwenview kvantum

echo "-------------------------------------------------"
echo "Creating Shortcut"
echo "-------------------------------------------------"

echo "Change Meta-Key to Open Overview"
kwriteconfig6 --file kwinrc --group ModifierOnlyShortcuts --key Meta "";
kwriteconfig6 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,Overview";
