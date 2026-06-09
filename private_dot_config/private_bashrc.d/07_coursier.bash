#!/bin/bash

# schala and coursier

_coursier_bin_path="$HOME/.local/share/coursier/bin/"
if [ -d "$_coursier_bin_path" ]; then 
  export PATH="$PATH:$_coursier_bin_path"
fi
