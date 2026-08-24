#!/usr/bin/env bash
cite about-plugin
about-plugin 'add yarn paths to path if they exist'

if type yarn &> /dev/null; then
  pathmunge "$(realpath $(yarn global bin))"
fi

