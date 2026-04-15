if [[ (-d "/usr/lib/node") ]]; then
  NODE_PATH="/usr/lib/node"
  path=(/usr/share/node/npm/bin $path)
  export NODE_PATH
fi

if [[ (-d "/usr/local/lib/node") ]]; then
  NODE_PATH="/usr/local/lib/node"
  path=(/usr/local/share/npm/bin $path)
  export NODE_PATH
fi
