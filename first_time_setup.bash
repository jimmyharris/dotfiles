#!/bin/bash

set -x

# Install required packages:
# Apt Packages
_apt_pkgs=(
  git
  bash
  curl
  wget
  build-essential
  pkg-config
  python3-pip
  clang-20
  libssl-dev
  unzip
  )
sudo apt install -y "${_apt_pkgs[@]}" || exit $?

# Setup rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || exit $?

# shellcheck disable=SC1090
. ~/.cargo/env

cargo --version || exit $?

# Install cargo extensions
_crates=(
  "cargo-update"
  "cargo-binstall"
  "tmuxedo"
  )

cargo install "${_crates[@]}" || exit $?

_binstall_crates=(
  bob-nvim
  stylua
  tree-sitter-cli
  ripgrep
  fd-find
  fnm
  viu
  starship
)
cargo binstall "${_binstall_crates[@]}" || exit $?

# Install uv
curl -LSf --max-time 30 --retry 5 "${UV_INSTALLER_URL-https://astral.sh/uv/install.sh}" | bash
# shellcheck disable=SC1090
. ~/.local/bin/env
uv --version || exit $?

# Install a version of node for Mason
eval "$(fnm env)"
fnm install v24.18.0 || exit $?

# Install stable nvim
bob use v0.12.4 || exit $?

# Install github client
(
  type -p wget >/dev/null \
  || (sudo apt update && sudo apt install wget -y)
) \
  && sudo mkdir -p -m 755 /etc/apt/keyrings \
  && out=$(mktemp) && wget -nv -O"$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  && cat "$out" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
  && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
  && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

gh auth login || exit $?

# Setup Chezmoi
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply jimmyharris

# Run chezmoi apply again after loading once to finish fzf setup
chezmoi apply
