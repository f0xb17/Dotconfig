#!/bin/sh

apps=(
    "bitwarden"
    "discord"
    "vlc"
    "obs-studio"
    "gufw"
    "kitty"
    "linux-firmware-qlogic"
    "zed"
)

# ---------------------------------------------------------------------------

sdks=(
    "cmake"
    "clang"
    "ninja"
    "gdb"
    "nodejs"
    "npm"
    "python"
    "jdk-openjdk"
    "kotlin"
)

# ---------------------------------------------------------------------------

fonts=(
    "ttf-meslo-nerd"
    "powerline-fonts"
    "noto-fonts-cjk"
    "noto-fonts-extra"
    "noto-fonts-emoji"
    "ttf-hack-nerd"
    "ttf-jetbrains-mono-nerd"
    "noto-fonts"
)

# ---------------------------------------------------------------------------

for app in "${apps[@]}"; do
    echo "----------------------------------"
    echo "Installing app: ${app}"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${app}
done

# ---------------------------------------------------------------------------

for sdk in "${sdks[@]}"; do
    echo "----------------------------------"
    echo "Installing SDK: ${sdk}"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${sdk}
done

# ---------------------------------------------------------------------------

for font in "${fonts[@]}"; do
    echo "----------------------------------"
    echo "Installing font: ${font}"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${font}
done
