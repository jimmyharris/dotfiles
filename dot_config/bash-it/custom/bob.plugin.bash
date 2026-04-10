#!/usr/bin/env bash
cite about-plugin
about-plugin 'add uv tool paths to path if they exist'

if type bob &> /dev/null; then
  pathmunge "$HOME/.local/share/bob/nvim-bin"
  _nvim_012_path="$HOME/.local/share/bob/v0.12.1"
  if [ -d "$_nvim_012_path" ]; then
    nvim_012() {
      NVIM_APPNAME=nvim-next "$_nvim_012_path/bin/nvim" "$@"
    }
  fi
fi
