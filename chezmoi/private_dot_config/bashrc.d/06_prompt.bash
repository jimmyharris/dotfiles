#!/bin/bash

# Starship setup.
if type starship &> /dev/null; then
  eval "$(starship init bash)"
fi

# Setup vscode: 

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  # shellcheck disable=SC1090
  source "$(code --locate-shell-integration-path bash)"
fi

# direnv setup. THIS MUST BE LAST!
if type direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi
