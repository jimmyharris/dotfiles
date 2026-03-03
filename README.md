# dotfiles
Condensed dot-files with history for chezmoi

The goal is to collapse some of my common configurations from neovim zshkit and
bash-it to support multiple operating systems.

This should also keep some common and useful git settings/utilities.

## Tmux Requirements

A default tmux configuraiton making use of the latest plugin technologies.

## Requires:

* tmux > 3.2
* bash
* AranBorkum/tmuxedo
* cargo (on linux)

### Install Requirements

#### Linux

```shell
cargo install --locked tmuxedo
```

#### Mac OS

```shell
brew install aranborkum/tap/tmuxedo
```
