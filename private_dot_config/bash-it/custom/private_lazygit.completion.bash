#!/usr/bin/env bash

cite about-plugin
about-plugin 'enable lazygit completion'

if type lazygit &> /dev/null; then
  eval "$(lazygit completion bash 2&>/dev/null)"
  # Alias completion support
fi
