#!/bin/sh

# Install dependencies for the plugins
echo "Installing dependencies"
sudo apt install git fzf ripgrep

# Install vim-plug to manage plugins
echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install bat (a better clone of cat)
echo "Installing bat"
curl -LO https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i bat_0.17.1_amd64.deb
rm bat_0.17.1_amd64.deb

# Install fonts
echo "Install custom font"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
cp MesloLGS* ~/.local/share/fonts
rm MesloLGS*

# Copy vim configuration file to the home path
echo "Copying configuration file"
cp vimrc ~/.vimrc

# Finish
echo "Setup complete!"
echo "Note - Change terminal font from Preferences to view all icons and symbols."
