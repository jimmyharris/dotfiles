#!/usr/bin/env bash
cite about-plugin
about-plugin 'add uv tool paths to path if they exist'

if type bob &> /dev/null; then
  pathmunge "$HOME/.local/share/bob/nvim-bin"
  nvim-012() {
    NVIM_APPNAME=nvim-012 bob run 0.12.1 "$@"
  }
  nvim-011() {
    NVIM_APPNAME=nvim-011 bob run 0.11.6 "$@"
  }
fi
