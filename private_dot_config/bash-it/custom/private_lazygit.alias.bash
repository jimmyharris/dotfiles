#!/usr/bin/env bash
cite about-plugin
about-plugin 'alias for lazygit for easier use'

if type lazygit &> /dev/null; then
  alias lg="lazygit"
fi

