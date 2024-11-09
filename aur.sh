#!/bin/sh

aur_apps=(
    "visual-studio-code-bin"
    "brother-mfc-l2710dw"
    "etcher-bin"
    "brave-bin"
    "zoom"
    "aic94xx-firmware"
    "wd719x-firmware"
    "upd72020x-fw"
    "intellij-idea-ultimate-edition"
    "intellij-idea-ultimate-edition-jre"
)

# ---------------------------------------------------------------------------

aur_sdks=(
)

# ---------------------------------------------------------------------------

aur_fonts=(
    "apple-fonts"
)

# ---------------------------------------------------------------------------

for aur_app in "${aur_apps[@]}"; do
    echo "----------------------------------"
    echo "Installing AUR-app: ${aur_app}"
    echo "----------------------------------"
    yay -S --noconfirm ${aur_app}
done

# ---------------------------------------------------------------------------

for aur_sdk in "${aur_sdks[@]}"; do
    echo "----------------------------------"
    echo "Installing AUR-app: ${aur_sdk}"
    echo "----------------------------------"
    yay -S --noconfirm ${aur_sdk}
done

# ---------------------------------------------------------------------------

for aur_font in "${aur_fonts[@]}"; do
    echo "----------------------------------"
    echo "Installing AUR-app: ${aur_font}"
    echo "----------------------------------"
    yay -S --noconfirm ${aur_font}
done

# ---------------------------------------------------------------------------
