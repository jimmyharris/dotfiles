#!/usr/bin/env bash

cite about-plugin
about-plugin 'enable bob completion'

if type bob &> /dev/null; then
  eval "$(bob complete bash 2&>/dev/null)"
fi

