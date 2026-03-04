#!/usr/bin/env bash

cite about-plugin
about-plugin 'enable nox completion'


if type nox &> /dev/null; then
	if type register-python-argcomplete &> /dev/null; then
		eval "$(register-python-argcomplete nox)"
	elif type register-python-argcomplete3 &> /dev/null; then
		eval "$(register-python-argcomplete3 nox)"
	fi
fi
