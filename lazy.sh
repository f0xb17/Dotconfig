#!/bin/sh

echo "-------------------------------------------------"
echo "Installing neoVim"
echo "-------------------------------------------------"

sudo pacman -S --needed --noconfirm neovim

echo "-------------------------------------------------"
echo "Installing LazyVim"
echo "-------------------------------------------------"

cp -r files/lazy.lua $HOME/.dotconf
cp -r files/options.lua $HOME/.dotconf
cp -r files/custom.lua $HOME/.dotconf

Source: https://www.lazyvim.org/installation
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "-------------------------------------------------"
echo "Creating Symlinks for LazyVim Config"
echo "-------------------------------------------------"

ln -sf $HOME/.dotconf/lazy.lua $HOME/.config/nvim/lua/config/
ln -sf $HOME/.dotconf/options.lua $HOME/.config/nvim/lua/config/
ln -sf $HOME/.dotconf/custom.lua $HOME/.config/nvim/lua/plugins/