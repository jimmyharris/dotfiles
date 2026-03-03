# Files to ignore during completion
fignore=(DS_Store $fignore)

# From OSX zsh templates
# http://code.google.com/p/zsh-templates-osx/

# enable menu selection
zstyle ':completion:*' menu select=10

# General completion technique
zstyle ':completion:*' completer _complete _approximate _prefix

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Always rehash commands.
zstyle ':completion:*:commands' rehash 1

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'

# Describe each match group.
zstyle ':completion:*:descriptions' format "%B---- %d%b"

# Messages/warnings format
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'

# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'


zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# LS Colours
# zmodload -i zsh/complist

# zstyle ':completion:*' list-colors ''

zstyle ':completion:*:*:kill:*:processes' list-colors \
  '=(#b) #([0-9]#)*=0=01;31'
