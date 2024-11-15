#!/bin/sh

#### PERFORMIG SYSTEMUPDATE ####

echo "#### PERFORMING SYSTEMUPDATE ####"

sudo pacman -Syu

# ---------------------------------------------------------------------------

#### Setting some variables ####

if [[ "$2" == "-kitty" ]]; then
  term="kitty"
elif [[ "$2" == "-alac" ]]; then
  term="alacritty"
elif [[ "$2" == "-wez" ]]; then
  term="wezterm"
fi

# ---------------------------------------------------------------------------

#### CREATING IMPORTANT FOLDERS ####

echo "#### CREATING FOLDERS ####"

mkdir ~/.themes/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created themes folder ---"
fi

mkdir ~/.local/share/icons
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created icon folder in .local/share/ ---"
fi

mkdir ~/.dotfiles
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created dotfiles ---"
fi

sudo mkdir /etc/cmdline.d/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created cmdline.d ---"
fi

# ---------------------------------------------------------------------------

#### CREATING SYMLINKS ####

echo "#### COPYING FILES ####"

cp -r etc/makepkg.conf ~/.dotfiles/

sudo ln -sf ~/.dotfiles/makepkg.conf /etc/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created Symlink: makepkg.conf"
fi

# ---------------------------------------------------------------------------

cp -r etc/mkinitcpio.conf ~/.dotfiles/

sudo ln -sf ~/.dotfiles/mkinitcpio.conf /etc/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created Symlink: mkinitcpio.conf"
fi

# ---------------------------------------------------------------------------

cp -r etc/cmdline.d/root.conf ~/.dotfiles/

sudo ln -sf ~/.dotfiles/root.conf /etc/cmdline.d/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created Symlink: root.conf"
fi

# ---------------------------------------------------------------------------

cp -r etc/modprobe.d/nvidia.conf ~/.dotfiles/

sudo ln -sf ~/.dotfiles/nvidia.conf /etc/modprobe.d/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created Symlink: nvidia.conf"
fi

# ---------------------------------------------------------------------------

cp -r etc/environment ~/.dotfiles/

sudo ln -sf ~/.dotfiles/environment /etc/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created Symlink: environment"
fi

# ---------------------------------------------------------------------------

#### KDE THINGS ####

if [[ "$1" == "-kde" ]]; then
  echo "#### DOING KDE THINGS ####"
  sudo pacman -S --needed --noconfirm flatpak xdg-desktop-portal xdg-desktop-portal-kde xdg-desktop-portal-gtk okular spectacle kcalc gwenview kvantum
  if [[ $? -eq 0 ]]; then
    echo "--- Successfully installed software: KDE"
  fi
  sudo pacman -Rcns kate
  if [[ $? -eq 0 ]]; then
    echo "--- Successfully removed software: Kate"
  fi
fi

# ---------------------------------------------------------------------------

#### GNOME THINGS ####

if [[ "$1" == "-gnome" ]]; then
  echo "#### DOING GNOME THINGS ####"
  sudo pacman -S --needed --noconfirm eog ghex gnome-boxes
  if [[ $? -eq 0 ]]; then
    echo "--- Successfully installed software: GNOME"
  fi
  sudo pacman -Rcns gnome-music totem yelp gnome-contacts gnome-clocks gnome-maps gnome-weather epiphany
  if [[ $? -eq 0 ]]; then
    echo "--- Successfully removed software: GNOME Standard"
  fi
fi

# ---------------------------------------------------------------------------

#### INSTTALLING BASE PACKAGES, THAT COULD BE USEFULL ####

base=(
    "git"
    "base-devel"
    "bluez"
    "bluez-utils"
    "cups"
    "cups-pdf"
    "fish"
    "which"
    "github-cli"
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
    "fd"
    "fisher"
    "starship"
    "xclip"
    "tmux"
    "tree"
)

# ---------------------------------------------------------------------------

for package in "${base[@]}"; do
    echo "#### INSTALLING PACKAGE: $package ####"
    sudo pacman -S --needed --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

#### YAY INSTALLATION ####

echo "#### INSTALLING PACKAGE: YAY ####"
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd ../ && rm -rf yay

# ---------------------------------------------------------------------------

#### INSTALLING APPS ####

software=(
    "bitwarden"
    "discord"
    "vlc"
    "obs-studio"
    "gufw"
    "linux-firmware-qlogic"
    "neovim"
)

# ---------------------------------------------------------------------------

for package in "${software[@]}"; do
    echo "#### INSTALLING PACKAGE: $package ####"
    sudo pacman -S --needed --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

#### INSTALLING DEVTOOLS ####

devtools=(
    "cmake"
    "clang"
    "ninja"
    "gdb"
    "nodejs"
    "deno"
    "npm"
    "python"
    "jdk-openjdk"
    "kotlin"
    "bun-bin"
)

# ---------------------------------------------------------------------------

for package in "${devtools[@]}"; do
    echo "#### INSTALLING PACKAGE: $package ####"
    sudo pacman -S --needed --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

#### INSTALLING FONTS ####

fonts=(
    "ttf-meslo-nerd"
    "powerline-fonts"
    "noto-fonts-cjk"
    "noto-fonts-extra"
    "noto-fonts-emoji"
    "ttf-hack-nerd"
    "ttf-jetbrains-mono-nerd"
    "noto-fonts"
    "ttf-firacode-nerd"
)

# ---------------------------------------------------------------------------

for package in "${fonts[@]}"; do
    echo "#### INSTALLING PACKAGE: $package ####"
    sudo pacman -S --needed --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

#### AUR PACKAGES ####

aursoftware=(
    "visual-studio-code-bin"
    "brother-mfc-l2710dw"
    "etcher-bin"
    "zoom"
    "aic94xx-firmware"
    "wd719x-firmware"
    "upd72020x-fw"
)

# ---------------------------------------------------------------------------

for package in "${aursoftware[@]}"; do
    echo "#### INSTALLING AUR-PACKAGE: $package ####"
    yay -S --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

aurdevtools=(
    "gleam"
)

# ---------------------------------------------------------------------------

for package in "${aurdevtools[@]}"; do
    echo "#### INSTALLING AUR-PACKAGE: $package ####"
    yay -S --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

aurfonts=(
    "apple-fonts"
)

# ---------------------------------------------------------------------------

for package in "${aurfonts[@]}"; do
    echo "#### INSTALLING AUR-PACKAGE: $package ####"
    yay -S --noconfirm ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

#### FLATPAK SOFTWARE ####

flatpak=(
    "com.spotify.Client"
    "com.anydesk.Anydesk"
    "io.github.shiftey.Desktop"
)

# ---------------------------------------------------------------------------

for package in "${flatpak[@]}"; do
    echo "#### INSTALLING Flatpak: $package ####"
    flatpak install -y flathub ${package}
    if [[ $? -eq 0 ]]; then
      echo "--- Successfully Installed: $package"
    else 
      echo "--- ERROR INSTALLING: $package"
    fi
done

# ---------------------------------------------------------------------------

#### STARTING SERVICES ####

echo "#### STARTING SERVICES ####"

# Printer Service
echo "--- Starting Printer Services"
sudo systemctl enable cups.service
sudo systemctl enable cups.socket
sudo systemctl start cups.service

# Bluetooth Service
echo "--- Starting Bluetooth Services"
modprobe btusb
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Firewall Service
echo "--- Starting Firewall Service & set to default to reject"
sudo ufw default reject
sudo ufw enable
sudo systemctl enable ufw.service

# nvidia Services
echo "--- Starting nvidia Services"
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

# ---------------------------------------------------------------------------

#### CONFIG TERMINAL ####

echo "#### TERMINAL CONFIGURATIONN ####"

echo "--- Starting Firewall Service & set to default to reject"
chsh -s $(which fish)

echo "--- Moving Fish Config"
mv .config/fish/config.fish ~/.config/fish/
mv .config/fish/fish_plugins ~/.config/fish/

source ~/.config/fish/config.fish
if [[ $? -eq 0 ]]; then
  echo "--- Successfully Reloaded fish config"
fi

#### INSTALLING Terminalemulator ####

echo "#### USING $term AS TERMINAL EMULATOR ####"
sudo pacman -S --needed --noconfirm $term
if [[ $? -eq 0 ]]; then
  echo "--- Successfully Installed: Kitty"
else 
  echo "--- ERROR INSTALLING: Kitty"
fi

if [[ "$2" == "-wez" ]]; then
  echo "--- Moving $term Config"
  mkdir ~/.config/wezterm/
  mv .config/wezterm/.wezterm.lua ~/.config/wezterm/
  ln -sf ~/.config/wezterm/.wezterm.lua ~/
else
  mv .config/$term/ ~/.config/
  if [[ $? -eq 0 ]]; then
    echo "--- Successfully copied $term config"
  else 
    echo "--- ERROR copying $term config"
  fi
fi

#### Setting Starship Theme ####

echo "--- Setting Starship Theme"
starship preset pastel-powerline -o ~/.config/starship.toml

#### Doing Tmux Stuff ####

echo "--- Install Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "--- Creating Tmux Config"
mkdir ~/.config/tmux
mv .config/tmux/.tmux.conf ~/.config/tmux/

ln -sf  ~/.config/tmux/.tmux.conf ~/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully created Symlink: .tmux.conf"
fi

tmux source ~/.tmux.conf

#### Fastfetch Stuff ####

mv .config/fastfetch ~/.config/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully copied folder: fastfetch"
fi

#### Copy nvim config ####

mv .config/nvim ~/.config/
if [[ $? -eq 0 ]]; then
  echo "--- Successfully copied folder: nvim"
fi

# ---------------------------------------------------------------------------

#### CHOOSE YOUR BROWSER ####

echo "#### Installing BROWSER ####"

if [[ "$3" == "-moz" ]]; then 

  sudo pacman -S --needed --noconfirm firefox-developer-edition

  if [[ $? -eq 0 ]]; then
    echo "--- Successfully Installed: Firefox Developer Edition"
  else 
    echo "--- ERROR INSTALLING: Firefox Developer Edition"
  fi

  sudo pacman -S --needed --noconfirm firefox-developer-edition-i18n-de

  if [[ $? -eq 0 ]]; then
    echo "--- Successfully Installed: Firefox Developer Edition: Language DE"
  else 
    echo "--- ERROR INSTALLING: Firefox Developer Edition: Language DE"
  fi
elif [[ "$3" == "-brave" ]]; then 
  yay -S --noconfirm brave-bin
  if [[ $? -eq 0 ]]; then
    echo "--- Successfully Installed: Firefox Developer Edition"
  else 
    echo "--- ERROR INSTALLING: Firefox Developer Edition"
  fi
elif [[ "$3" == "-all" ]]; then 

  sudo pacman -S --needed --noconfirm firefox-developer-edition

  if [[ $? -eq 0 ]]; then
    echo "--- Successfully Installed: Firefox Developer Edition"
  else 
    echo "--- ERROR INSTALLING: Firefox Developer Edition"
  fi

  sudo pacman -S --needed --noconfirm firefox-developer-edition-i18n-de

  if [[ $? -eq 0 ]]; then
    echo "--- Successfully Installed: Firefox Developer Edition: Language DE"
  else 
    echo "--- ERROR INSTALLING: Firefox Developer Edition: Language DE"
  fi

  yay -S --noconfirm brave-bin

  if [[ $? -eq 0 ]]; then
    echo "--- Successfully Installed: Firefox Developer Edition"
  else 
    echo "--- ERROR INSTALLING: Firefox Developer Edition"
  fi
fi

# ---------------------------------------------------------------------------

#### CLEANING UP ####

echo "#### FINISHING ####"

echo "--- Cleaning Package Caches"
yay -Scc
yay -Yc

# ---------------------------------------------------------------------------

#### FINISHING TOUCHES ####

echo "--- Running Fisher Update"
fisher update

echo "--- Running mkinitcpio"
sudo mkinitcpio -P

# ---------------------------------------------------------------------------

#### HAVE A NICE DAY SIR ####

echo "--- Installation finished. Performing reboot now?"
echo "Press enter to continue..."
read

reboot