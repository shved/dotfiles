#!/usr/bin/env bash

# === INSTALL THIGS ===
sudo apt install build-essential cmake python3-dev python3-pip neovim zsh curl nodejs npm yarn jq git ripgrep silversearcher-ag flameshot ncdu fd-find

# === POSTGRES ===
sudo apt install postgresql postgresql-contrib libpq-dev

# === GO ===
curl -sSL https://git.io/g-install | sh -s

# === RUST ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install sd

# === RUBY ===
wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz
tar -xzvf ruby-install-0.8.1.tar.gz
cd ruby-install-0.8.1/
sudo make install
cd ..
rm -r ruby-install-0.8.1
rm ruby-install-0.8.1.tar.gz

ruby-install ruby-3.0.0

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ..
rm -r chruby-0.3.9
rm chruby-0.3.9.tar.gz

cp -f .irbrc $HOME

# === VIM ===
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install neovim

mkdir -p $HOME/.config/nvim
cp -f nvim/init.vim $HOME/.config/nvim/init.vim

nvim +PlugInstall +UpdateRemotePlugins +qa

python3 $HOME/.local/share/nvim/plugged/YouCompleteMe/install.py --all

# === ZSH ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

cp -f .zshrc $HOME

# === MISC ===

cp -f ssh/config $HOME/.ssh

cp -f ssh/id_rsa.pub $HOME/.ssh/id_rsa.pub
chmod 600 $HOME/.shh/id_rsa.pub

mkdir -p $HOME/workspace

cp -f .gitconfig $HOME
