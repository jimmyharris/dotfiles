# If we have installed cabal locally then use it to generate pandoc documents.
if [[ -d "$HOME/.cabal/bin" ]]; then
  path=(~/.cabal/bin $path)
fi
