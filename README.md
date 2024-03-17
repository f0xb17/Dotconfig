# DotConfig or yet another Linux Config

## 1 Introduction

In this repository, I would like to provide my Arch Linux configuration.  

To simplify the setup, I have written a shell script that does the setup almost automatically. 

## 2 How to run?

```shell

$ git clone https://github.com/f0xb17/dotconfig.git
$ cd dotconfig 

$ ./install.sh --gnome
```

## 2.1 Parameters

1. Gnome specific installation: `--gnome`
2. KDE Plasma specific installation: `--kde`
3. XFCE specific installation: `--xfce`
4. Cinnamon specific installation: `--cinnamon`

## 2.2 Why parameters?

In order for Flatpak Support to be installed correctly, the correct parameter must be set for your DE.

Different packages are also installed for each parameter:

1. `--kde`: Simple Flatpak support without Gnome Software, because KDE Plasma has Discovery. 
2. `--cinnamon`: Flatpak support with Gnome software and Cinnamon Translations.
3. `--xfce`: Flatpak support with Gnome software.
4. `--gnome`: Has Flatpak support out of the box. Removes unneeded standard software. 