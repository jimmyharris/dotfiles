#!/bin/bash

# if fnm is in the path then we need to set it up


if type -t fnm &> /dev/null; then
  # import fnm
  eval "$(fnm env --shell bash)"

  # setup fnm completions
  eval "$(fnm completions --shell bash)"
fi
