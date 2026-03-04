#!/usr/bin/env bash
cite about-plugin
about-plugin 'alias for chezmoi for easier use'

if type chezmoi &> /dev/null; then
  eval "$(chezmoi completion bash)"
fi

