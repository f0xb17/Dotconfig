# DotConfig or yet another Linux Config

## 1 Introduction

In this repository, I would like to provide my Arch Linux configuration.  

To simplify the setup, I have written a shell script that does the setup almost automatically. 

## 2 Dependencies

```shell
$ sudo pacman -S git
```

## 2.1 Adjustments

1. `mkinitcpio.conf` - If you have an AMD GPU, delete all nVidia modules from this file.
2. `root.conf` - If you have an AMD GPU, delete all nVidia kernel parameters from this file.
3. `nvidia.conf` - Prevent this file from being copied and prevent the symlink from being created. 

```shell
$ # cp -r files/nvidia.conf $HOME/.dotconf
$ # sudo ln -sf $HOME/.dotconf/nvidia.conf /etc/modprobe.d/
```

4. `environment` - If you have an AMD GPU, delete all nVidia variables from this file.
5. `install.sh` - Prevent the nVidia services from being started. 

```shell
# nVidia Services
$ # sudo systemctl enable nvidia-suspend.service
$ # sudo systemctl enable nvidia-hibernate.service
$ # sudo systemctl enable nvidia-resume.service
```

## 3 How to run?

```shell
$ git clone https://github.com/f0xb17/dotconfig.git
$ cd dotconfig 

$ ./install.sh --gnome
```

## 3.1 Parameters

1. Gnome specific installation: `--gnome`
2. KDE Plasma specific installation: `--kde`
3. XFCE specific installation: `--xfce`
4. Cinnamon specific installation: `--cinnamon`

## 3.2 Why parameters?

In order for Flatpak Support to be installed correctly, the correct parameter must be set for your DE.

Different packages are also installed for each parameter:

1. `--kde`: Simple Flatpak support without Gnome Software, because KDE Plasma has Discovery. 
2. `--cinnamon`: Flatpak support with Gnome software and Cinnamon Translations.
3. `--xfce`: Flatpak support with Gnome software.
4. `--gnome`: Has Flatpak support out of the box. Removes unneeded standard software. 