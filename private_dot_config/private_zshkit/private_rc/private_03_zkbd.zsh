if [[ -f ~/.zkbd/$TERM-$VENDOR-$OSTYPE ]]; then
	source ~/.zkbd/$TERM-$VENDOR-$OSTYPE
else
	source $ZSHKIT/default_zkbd
fi
