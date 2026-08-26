#!/bin/bash

set -x

# Check if we have a controlling tty
__has_controlling_tty() {
  { true < /dev/tty; } 2>/dev/null
}

__run_with_controlling_tty() {
  if __has_controlling_tty; then
    "$@" < /dev/tty
  else
    "$@"
  fi
}


: "${CHEZMOI_SRC:=}"
CHEZMOI_SRC_FLAG=()
[ -n "${CHEZMOI_SRC}" ] && CHEZMOI_SRC_FLAG=(--source "${CHEZMOI_SRC}")

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
  "cargo-binstall"
  )

cargo install --locked "${_crates[@]}" || exit $?

_binstall_crates=(
  cargo-update
  bob-nvim
  stylua
  tree-sitter-cli
  ripgrep
  fd-find
  fnm
  viu
  starship
  tmuxedo
)
cargo binstall --disable-telemetry -y --locked "${_binstall_crates[@]}" || exit $?

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

# Authenticate GitHub CLI only when needed, and only when we can actually
# interact with the user.
# pipe but the controlling terminal remains reachable at /dev/tty.

# If we are already authenticated we don't need to authenticate here again.
if gh auth status --hostname github.com >/dev/null 2>&1; then
  echo "GitHub CLI already authenticated; skipping gh auth login." >&2
# If we have a GH_TOKEN or GITHUB_TOKEN env, use that
elif [ -n "${GH_TOKEN:-}" ] || [ -n "${GITHUB_TOKEN:-}" ]; then
  echo "GH_TOKEN/GITHUB_TOKEN present; skipping interactive gh auth login." >&2
# If we are using a tty then ask the user for the login.
elif __has_controlling_tty; then
  gh auth login --hostname github.com < /dev/tty || exit $?
else
  echo "Non-interactive shell with no controlling terminal; skipping gh auth login." >&2
  echo "Provide GitHub auth out of band (for example, with GH_TOKEN) if git operations are needed." >&2
fi

# Setup Chezmoi
if [ "${CHEZMOI_SKIP_INIT:-0}" != "1" ]; then
  __run_with_controlling_tty sh -c "$(curl -fsLS https://get.chezmoi.io)" -- \
    init --apply "${CHEZMOI_SRC_FLAG[@]}" jimmyharris || exit $?

  # Run chezmoi apply again after loading once to finish fzf setup
  __run_with_controlling_tty chezmoi apply "${CHEZMOI_SRC_FLAG[@]}"
fi
