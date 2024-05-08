sudo dnf install ripgrep clang cmake

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
