#!/bin/sh

# Performing Systemupdate

echo "-------------------------------------------------"
echo "Performing Systemupdate"
echo "-------------------------------------------------"

sudo pacman -Syu

echo "---------------------------------------------------------------"

# Creating necessary files and folders

echo "-------------------------------------------------"
echo "Creating necessary files and folders"
echo "-------------------------------------------------"

mkdir $HOME/.dotconf
sudo mkdir /etc/cmdline.d/

echo "---------------------------------------------------------------"

# Copy files to .dotconf location

echo "-------------------------------------------------"
echo "Copy files to .dotconf location"
echo "-------------------------------------------------"

cp -r files/makepkg.conf $HOME/.dotconf/
cp -r files/.zshrc $HOME/.dotconf/
cp -r files/.aliases $HOME/.dotconf/
cp -r files/nvidia.conf $HOME/.dotconf
cp -r files/root.conf $HOME/.dotconf
cp -r files/environment $HOME/.dotconf
cp -r files/mkinitcpio.conf $HOME/.dotconf
cp -r files/lazy.lua $HOME/.dotconf
cp -r files/options.lua $HOME/.dotconf
cp -r files/custom.lua $HOME/.dotconf

echo "---------------------------------------------------------------"

# Parameters to install flatpak

if [[ "$1" == "--kde" ]]; then
    echo "-------------------------------------------------"
    echo "Installing Flatpak for KDE"
    echo "-------------------------------------------------"

    sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-kde xdg-desktop-portal-gtk
    
    echo "---------------------------------------------------------------"
fi

if [[ "$1" == "--cinnamon" ]]; then
    echo "-------------------------------------------------"
    echo "Install Flatpak for Cinnamon"
    echo "-------------------------------------------------"

    sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-xapp xdg-desktop-portal-gtk gnome-software xarchiver cinnamon-translations
    
    echo "---------------------------------------------------------------"
fi

if [[ "$1" == "--xfce" ]]; then
    echo "-------------------------------------------------"
    echo "Install Flatpak for Xfce"
    echo "-------------------------------------------------"
    
    sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-xapp xdg-desktop-portal-gtk gnome-software
    
    echo "---------------------------------------------------------------"
fi

# Installing base packages

echo "-------------------------------------------------"
echo "Performing package installation: pacman -S"
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
    "neovim"
    "ntfs-3g"
    "neofetch"
)

for package in "${packages[@]}"; do
    echo "----------------------------------"
    echo "Installing package: $package"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${package}
done

echo "---------------------------------------------------------------"

# Installing oh-my-zsh

echo "-------------------------------------------------"
echo "Performing Oh-My-Zsh Installation"
echo "-------------------------------------------------"

mkdir zsh && cd zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cd ../
rm -rf zsh
chsh -s $(which zsh) # Setting zsh as standard shell. Root password needed!

echo "---------------------------------------------------------------"

# Installing Oh-My-Zsh Plugins

echo "-------------------------------------------------"
echo "Performing Oh-My-Zsh Installation"
echo "-------------------------------------------------"

# Source: https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete

echo "---------------------------------------------------------------"

# Installing LazyVim

echo "-------------------------------------------------"
echo "Performing LazyVim installation"
echo "-------------------------------------------------"

# Source: https://www.lazyvim.org/installation
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "---------------------------------------------------------------"

# Symlinking files to locations

echo "-------------------------------------------------"
echo "Symlinking files to locations"
echo "-------------------------------------------------"

ln -sf $HOME/.dotconf/.zshrc $HOME/
ln -sf $HOME/.dotconf/.aliases $HOME/
ln -sf $HOME/.dotconf/lazy.lua $HOME/.config/nvim/lua/config/
ln -sf $HOME/.dotconf/options.lua $HOME/.config/nvim/lua/config/
ln -sf $HOME/.dotconf/custom.lua $HOME/.config/nvim/lua/plugins/
sudo ln -sf $HOME/.dotconf/root.conf /etc/cmdline.d/
sudo ln -sf $HOME/.dotconf/nvidia.conf /etc/modprobe.d/
sudo ln -sf $HOME/.dotconf/environment /etc/
sudo ln -sf $HOME/.dotconf/mkinitcpio.conf /etc/
sudo ln -sf $HOME/.dotconf/makepkg.conf /etc/

echo "---------------------------------------------------------------"

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

# nVidia Services
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service


echo "---------------------------------------------------------------"


# Installing AUR Helper yay

echo "-------------------------------------------------"
echo "Performing yay Installation"
echo "-------------------------------------------------"

git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd ../ && rm -rf yay

echo "---------------------------------------------------------------"

# At that point some things need to confirmed. Take a look on the screen and follow the instructions, you may see. 

# Installing Software, SDKs and Fonts

echo "-------------------------------------------------"
echo "Performing Software Installation"
echo "-------------------------------------------------"

apps=(
    "bitwarden"
    "discord"
    "gufw"
    "tilix"
)

sdks=(
    "cmake"
    "clang"
    "ninja"
    "gdb"
    "nodejs"
    "npm"
    "python"
)

fonts=(
    "ttf-meslo-nerd"
    "powerline-fonts"
    "noto-fonts-cjk"
    "noto-fonts-extra"
    "noto-fonts-emoji"
    "ttf-hack-nerd"
    "ttf-jetbrains-mono-nerd"
    "ttf-ibmplex-mono-nerd"
)

for app in "${apps[@]}"; do
    echo "----------------------------------"
    echo "Installing app: ${app}"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${app}
done

echo "---------------------------------------------------------------"

for sdk in "${sdks[@]}"; do
    echo "----------------------------------"
    echo "Installing SDK: ${sdk}"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${sdk}
done

echo "---------------------------------------------------------------"

for font in "${fonts[@]}"; do
    echo "----------------------------------"
    echo "Installing font: ${font}"
    echo "----------------------------------"
    sudo pacman -S --needed --noconfirm ${font}
done

echo "---------------------------------------------------------------"

# Installing Software from flathub

flatpaks=(
    "com.spotify.Client"
)

for flatpak in "${flatpaks[@]}"; do
    echo "----------------------------------"
    echo "Installing flatpak: ${flatpak}"
    echo "----------------------------------"
    flatpak install flathub ${flatpak}
done

# Installing Gnome ExtensionManager without using Gnome would be funny.
if [[ "$1" == "--gnome" ]]; then
    echo "----------------------------------"
    echo "Installing Gnome specific flatpak: Gnome ExtensionManager"
    echo "----------------------------------"
    flatpak install flathub com.mattjakeman.ExtensionManager
fi


echo "---------------------------------------------------------------"

# Installing Software from the AUR.

aur_apps=(
    "visual-studio-code-bin"
    "intellij-idea-ultimate-edition"
    "brother-mfc-l2710dw"
    "microsoft-edge-stable-bin"
)

aur_sdks=(
    "jdk-temurin"
)

aur_fonts=(
    "sf-fonts"
)

for aur_app in "${aur_apps[@]}"; do
    echo "----------------------------------"
    echo "Installing AUR-app: ${aur_app}"
    echo "----------------------------------"
    yay -S --noconfirm ${aur_app}
done

echo "---------------------------------------------------------------"

for aur_sdk in "${aur_sdks[@]}"; do
    echo "----------------------------------"
    echo "Installing AUR-app: ${aur_sdk}"
    echo "----------------------------------"
    yay -S --noconfirm ${aur_sdk}
done

echo "---------------------------------------------------------------"

for aur_font in "${aur_fonts[@]}"; do
    echo "----------------------------------"
    echo "Installing AUR-app: ${aur_font}"
    echo "----------------------------------"
    yay -S --noconfirm ${aur_font}
done

echo "---------------------------------------------------------------"

# Changing Folder Permissions

echo "-------------------------------------------------"
echo "Changing Folder Permissions"
echo "-------------------------------------------------"

sudo chown -R $(whoami) /opt/visual-studio-code

echo "---------------------------------------------------------------"

# Cleaning

echo "-------------------------------------------------"
echo "Cleaning Caches"
echo "-------------------------------------------------"

yay -Scc
yay -Yc

echo "---------------------------------------------------------------"

# Finishing the Installation by deleting not needed Software. 

echo "----------------------------------"
echo "Finishing"
echo "----------------------------------"

if [[ "$1" == "--gnome" ]]; then
    sudo pacman -Rcns gnome-music totem yelp gnome-contacts gnome-clocks gnome-maps gnome-weather
fi

sudo mkinitcpio -P

echo "---------------------------------------------------------------"

# Finishing the Installation by deleting not needed Software. 

echo "Installation finished. Performing reboot now?"
echo "Press enter to continue..."
read

reboot