#!/bin/bash

BASH_IT="${XDG_CONFIG_DIR:="$HOME/.config"}/bash-it"

source "${BASH_IT}/bash_it.sh"

bash-it profile load personal
