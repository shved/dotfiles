sudo dnf install ripgrep clang cmake openssl-devel helix wl-clipboard openssl gnome-tweaks

# === GO ===
curl -sSL https://git.io/g-install | sh -s
go install github.com/go-delve/delve/cmd/dlv@latest
sudo dnf install golang-x-tools-gopls

go install github.com/antonmedv/fx@latest

# === RUST ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
rustup component add rustfmt

cargo install loc
cargo install taplo-cli --locked
cargo install clippy

