if [[ -x /usr/libexec/path_helper ]]; then
  eval $(/usr/libexec/path_helper -s)
fi

path=(/usr/local/bin /usr/bin /usr/local/sbin /usr/sbin $path)

# If macports is installed
if [[ (! -L "/opt/local" ) && ( -d "/opt/local") ]]; then
  path=(/opt/local/bin $path)
  manpath=(/opt/local/man $manpath)
fi

if [[ -d "$HOME/.linuxbrew/bin" ]]; then
  path=("$HOME/.linuxbrew/bin" $path)
fi

if [[ -f "$HOME/.local/bin/env" ]]; then
  source "$HOME/.local/bin/env"
fi

# set up fpath
fpath=("$ZSHKIT/func" $fpath)

# Setup home directory bin path.
path=("$HOME/bin" $path)

if [ -f "$HOME/.cargo/env" ]; then 
  source "$HOME/.cargo/env"
fi

if [[ -x `which fnm` ]]; then
  source <(fnm env --shell zsh)
fi

if [ -f "$HOME/.local/share/bob/env/env.sh" ]; then 
  source "$HOME/.local/share/bob/env/env.sh"
fi

typeset -U path fpath manpath
