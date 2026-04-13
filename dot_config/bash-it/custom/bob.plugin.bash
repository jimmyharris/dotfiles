#!/usr/bin/env bash
cite about-plugin
about-plugin 'add uv tool paths to path if they exist'

if type bob &> /dev/null; then
  pathmunge "$HOME/.local/share/bob/nvim-bin"
  if [ -d "$_nvim_012_path" ]; then
    nvim-012() {
      NVIM_APPNAME=nvim-012 bob run 0.12.1 "$@"
    }
  fi
  if [ -d "$_nvim_011_path" ]; then
    nvim-011() {
      NVIM_APPNAME=nvim-011 bob run 0.11.6 "$@"
    }
  fi
fi
