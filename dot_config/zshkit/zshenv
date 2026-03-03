source $ZSHKIT/env/path.zsh

local_env="$ZSHKIT/env/local"

for script in $local_env/*.(sh|zsh); do
  if [ -f "$script" ]; then
    source $script
  fi
done
