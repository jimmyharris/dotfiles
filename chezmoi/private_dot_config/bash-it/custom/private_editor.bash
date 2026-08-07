# Set my $EDITOR based on what we have installed. I prefer vscode if I can get
# it.for it

# If we are running in a visual studio code integrated terminal:
if [ "$TERM_PROGRAM" == "vscode" ]; then
  EDITOR="code --wait"
  # source "$(code --locate-shell-integration-path bash)"
elif command -v nvim &> /dev/null; then
  EDITOR="nvim"
elif command -v code &> /dev/null; then
  EDITOR="code --wait"
elif command -v vim &> /dev/null; then
  EDITOR="vim"
elif command -v nano &> /dev/null; then
  EDITOR="nano"
elif command -v pico &> /dev/null; then
  EDITOR="pico"
else
  EDITOR="vi"
fi

export EDITOR

