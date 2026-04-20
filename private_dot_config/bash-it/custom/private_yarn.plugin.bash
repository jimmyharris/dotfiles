#!/usr/bin/env bash
cite about-plugin
about-plugin 'add uv tool paths to path if they exist'

if type yarn &> /dev/null; then
  pathmunge "$(yarn global bin)"
fi

