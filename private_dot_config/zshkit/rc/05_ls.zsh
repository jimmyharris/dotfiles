
# On my mac I may have gnu coreutils installed. In that case it will be called
# gls. On a normal Linux distro it will simply be ls. If I am not on linux and
# gls doesn't exist, then I am using BSD LS.

if [[ -x `which gls` ]]; then
	alias rls=`which ls`
	alias ls='gls -h --color=auto '
  # completion colours
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
elif [[ $OSTYPE == "linux-gnu" ]]; then
	alias ls='ls -h --color=auto '
  # completion colours
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  # TODO: Fix bsd ls for solarized. much uglier than it seems.
	# export LS_COLORS=BxfxcxdxCxegedabagacadp
	export LS_COLORS=gxfxbEaEBxxEhEhBaDaCaD
fi
