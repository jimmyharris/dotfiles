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

if [[ -d "$HOME/.local/bin" ]]; then
  path=("$HOME/.local/bin" $path)
fi

# set up fpath
fpath=("$ZSHKIT/func" $fpath)

# Setup home directory bin path.
path=("$HOME/bin" $path)

typeset -U path fpath manpath
