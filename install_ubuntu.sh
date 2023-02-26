#!/usr/bin/env bash

# === INSTALL THIGS ===
sudo apt install build-essential cmake python3-dev python3-pip python3-neovim zsh curl jq git ripgrep ncdu fd-find software-properties-common

# === GO ===
curl -sSL https://git.io/g-install | sh -s

# === RUST ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
cargo install sd

# === NVIM ===
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

pip3 install neovim

mkdir -p $HOME/.config
cp -f nvim $HOME/.config/

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
