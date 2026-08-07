#!/usr/bin/env bash

cite about-plugin
about-plugin 'enable pipx completion'

if type uv &> /dev/null; then
  eval "$(uv generate-shell-completion bash)"
fi

