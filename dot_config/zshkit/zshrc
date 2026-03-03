typeset -gx ZPLUG_HOME=$HOME/.config/zplug

if [ ! -s "$ZPLUG_HOME/init.zsh" ]; then
    printf "Install zplug ? [y/N]: "
    if read -q; then
        echo; curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
fi

if [ -s "$ZPLUG_HOME/init.zsh" ]; then
    source $ZPLUG_HOME/init.zsh

    # Load all plugins
    source $ZSHKIT/packages.zsh

    # Install plugins if there are plugins that have not been installed
    if ! zplug check; then
        printf "Install zplug plugins? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load
fi
# Make sure paths don't grow endlessly with subshells.
typeset -U path fpath
