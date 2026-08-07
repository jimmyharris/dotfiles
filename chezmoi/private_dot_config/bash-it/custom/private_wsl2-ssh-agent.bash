#!/usr/bin/env bash
cite about-plugin
about-plugin 'enable wsl2-ssh-agent'

if type wsl2-ssh-agent &> /dev/null; then
  eval "$(wsl2-ssh-agent)"
fi

