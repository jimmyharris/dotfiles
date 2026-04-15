#!/usr/bin/env bash
cite about-plugin
about-plugin 'alias for chezmoi for easier use'

if type chezmoi &> /dev/null; then
  eval "$(chezmoi completion bash)"
  if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_chezmoi cz
  else
      complete -o default -o nospace -F __start_chezmoi cz
  fi
fi

