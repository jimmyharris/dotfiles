if [[ -x `which chezmoi` ]]; then
  source <(chezmoi completion zsh)

  alias cz=chezmoi
fi
