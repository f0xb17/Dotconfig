#!/bin/sh

echo "-------------------------------------------------"
echo "Package Installation: KDE Plasma"
echo "-------------------------------------------------"

sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-kde xdg-desktop-portal-gtk okular spectacle kcalc gwenview kvantum

echo "-------------------------------------------------"
echo "Installing kwin Script"
echo "-------------------------------------------------"

echo "Copying kwin.sh"
cp -r files/kwin.sh $HOME/.dotconf
echo "User Permission changed"
chmod a+x $HOME/.dotconf/kwin.sh

echo "Creating plasma-workspaces Folder"
mkdir $HOME/.config/plasma-workspace
mkdir $HOME/.config/plasma-workspace/env

ln -sf $HOME/.dotconf/kwin.sh $HOME/.config/plasma-workspace/env/

echo "-------------------------------------------------"
echo "Writing XORG.conf"
echo "-------------------------------------------------"

echo "Copying XORG.conf"
cp -r files/xorg.conf $HOME/.dotconf
sudo ln -sf $HOME/.dotconf/xorg.conf /etc/X11/


echo "-------------------------------------------------"
echo "Creating Shortcut"
echo "-------------------------------------------------"

echo "Change Meta-Key to Open Overview"
kwriteconfig6 --file kwinrc --group ModifierOnlyShortcuts --key Meta "";
kwriteconfig6 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,Overview";
