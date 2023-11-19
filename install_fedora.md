# add to /etc/dnf/dnf.conf
# fastestmirror=True
# max_parallel_downloads=8
# defaultyes=True

# add rpmfusion repos

sudo dnf install ripgrep clang cmake

# === ZSH ===
sudo dnf install zsh util-linux-user
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

# === GO ===
curl -sSL https://git.io/g-install | sh -s
go install github.com/go-delve/delve/cmd/dlv@latest
sudo dnf install golang-x-tools-gopls

go install github.com/antonmedv/fx@latest

# === RUST ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
rustup component add rustfmt

# === NVIM ===
sudo dnf install neovim python3-neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerSync +GoInstallBinaries +q

# === RUBY ===
cargo install frum
eval "$(frum init)"
frum install
