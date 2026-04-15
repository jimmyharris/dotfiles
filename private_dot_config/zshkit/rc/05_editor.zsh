if [[ -x `which nvim` ]]; then
	EDITOR=nvim
elif [[ -x `which vim` ]]; then
	EDITOR=vim
elif [[ -x `which nano` ]]; then
	EDITOR=nano
elif [[ -x `which pico` ]]; then
	EDITOR=pico
else
	EDITOR=vi
fi

export EDITOR
