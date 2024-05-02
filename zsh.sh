#!/bin/sh

echo "-------------------------------------------------"
echo "Performing Oh-My-Zsh Installation"
echo "-------------------------------------------------"

mkdir zsh && cd zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cd ../
rm -rf zsh
chsh -s $(which zsh) # Setting zsh as standard shell. Root password needed!

echo "-------------------------------------------------"
echo "Installing Oh-My-Zsh Plugins"
echo "-------------------------------------------------"

# Source: https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete

echo "-------------------------------------------------"
echo "Copying Oh-My-Zsh Config"
echo "-------------------------------------------------"

echo "Copying .zshrc"
cp -r files/.zshrc $HOME/.dotconf/
ln -sf $HOME/.dotconf/.zshrc $HOME/

echo "Copying .aliases"
cp -r files/.aliases $HOME/.dotconf/
ln -sf $HOME/.dotconf/.aliases $HOME/