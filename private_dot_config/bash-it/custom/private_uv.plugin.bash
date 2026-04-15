#!/usr/bin/env bash
cite about-plugin
about-plugin 'add uv tool paths to path if they exist'

if type uv &> /dev/null; then
	pathmunge "$(uv tool dir --bin)"
fi

