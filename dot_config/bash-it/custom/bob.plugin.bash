#!/usr/bin/env bash
cite about-plugin
about-plugin 'add uv tool paths to path if they exist'

if type bob &> /dev/null; then
  pathmunge "$HOME/.local/share/bob/nvim-bin"
fi

