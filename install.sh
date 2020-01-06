#!/usr/bin/env bash

sudo apt install neovim
sudo apt install zsh
sudo apt install curl
sudo apt install nodejs
sudo apt install yarn
sudo apt install rust
sudo apt install golang
sudo apt install jq

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/workspace

cp -f .ackrc $HOME
cp -f .gitconfig $HOME

mkdir -p $HOME/.config/nvim/colors
cp -f nvim/colors/* $HOME/.config/nvim/colors
cp -f nvim/init.vim $HOME/.config/nvim

nvim -E -c 'PlugInstall | quit | quit'

cp -f ssh/id_rsa.pub $HOME/.ssh
cp -f ssh/config $HOME/.ssh

# ruby-install
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz
cd ruby-install-0.7.0/
sudo make install
cd ..
rm -r ruby-install-0.7.0
rm ruby-install-0.7.0.tar.gz

ruby-install ruby-2.7.0

# chruby
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ..
rm -r chruby-0.3.9
rm chruby-0.3.9.tar.gz

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

cp -f .zshrc $HOME
