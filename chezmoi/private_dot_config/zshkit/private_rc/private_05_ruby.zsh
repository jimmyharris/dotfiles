alias irb='irb --readline -r irb/completion'

# Rbenv support
#
# Rbenv support
#
if [[ -d "${HOME}/.rbenv/bin" ]]; then
  rbenv_root="${HOME}/.rbenv"
elif [[ -d "/usr/local/rbenv/bin" ]]; then
  rbenv_root="/usr/local/rbenv"
  export RBENV_ROOT="$rbenv_rooth"
elif [[ -s /Users/ramiel/.rvm/scripts/rvm ]] ; then 
  source /Users/ramiel/.rvm/scripts/rvm ; 
elif [[ -s /usr/local/rvm/scripts/rvm ]] ; then 
  source /usr/local/rvm/scripts/rvm ; 
fi

if [[ -n $rbenv_root ]]; then
  path=($rbenv_root/bin $path)
  path=($rbenv_root/shims $path)
  . "$rbenv_root/completions/rbenv.zsh"
  rbenv() {
    local command="$1"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
      shell)
        eval `rbenv "sh-$command" "$@"`;;
      *)
        command rbenv "$command" "$@";;
    esac
  }
fi
