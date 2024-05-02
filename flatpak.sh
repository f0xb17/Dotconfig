#!/bin/sh

flatpaks=(
    "com.spotify.Client"
    "com.anydesk.Anydesk"
    "io.github.shiftey.Desktop"
)

# ---------------------------------------------------------------------------

for flatpak in "${flatpaks[@]}"; do
    echo "----------------------------------"
    echo "Installing flatpak: ${flatpak}"
    echo "----------------------------------"
    flatpak install flathub ${flatpak}
done

# ---------------------------------------------------------------------------

# Installing Gnome ExtensionManager without using Gnome would be funny.
if [[ "$1" == "--gnome" ]]; then
    echo "----------------------------------"
    echo "Installing Gnome specific flatpak: Gnome ExtensionManager"
    echo "----------------------------------"
    flatpak install flathub com.mattjakeman.ExtensionManager
fi