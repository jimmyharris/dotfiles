#!/usr/bin/env bash
cite about-plugin
about-plugin 'completions for the eternal-terminal for easier use'


type et &> /dev/null || return

# Compatible with et >= 7.1.0 (OpenSSH-style short options).
# Short options like -p, -l, -c, -t, -r, -x, -f, -N, -e, -o, -L, -R, -D, -W,
# -J, -i, -F, -O, -M, -S, -T, -G and -V now follow ssh semantics.

_et_long_opts="
  --help --version --username --port --command --noexit --terminal-path
  --tunnel --reversetunnel --jumphost --jport --jserverfifo
  --kill-other-sessions --close-on-hangup --disconnect-timeout --macserver
  --verbose --keepalive --logdir --logtostdout --silent --no-terminal
  --dynamic --stdio-forward --no-pty --ctl --ctl-socket --forward-ssh-agent
  --ssh-socket --ssh-config --no-ssh-config --telemetry --name --no-persist
  --attach --kill --list --serverfifo --ssh-option
"
_et_short_opts="
  -h -V -G -u -p -l -c -t -x -f -N -v -e -L -R -D -W -T -r -j -J -k -i -F -o
  -M -S -O
"
# Options that consume the next word.
_et_arg_opts=" -u --username --port --command --terminal-path --tunnel -r
  --reversetunnel -j --jumphost --jport --jserverfifo --disconnect-timeout
  --verbose -k --keepalive --logdir -D --dynamic -W --stdio-forward --ctl-socket
  --ssh-socket -F --ssh-config --name --attach --kill --serverfifo --ssh-option
  -o -p -l -c -e -L -R -i -J -S -O "

_et_session_names() {
  et --list 2> /dev/null | awk 'NR>1 && NF && !/WARNING|ERROR/ && $1 ~ /^[A-Za-z0-9_.-]+$/ {print $1}'
}

_et() {
  local cur prev words cword
  _init_completion -s || return

  case "$prev" in
    --logdir|--serverfifo|--jserverfifo)
      _filedir -d
      return
      ;;
    --terminal-path|--ssh-socket|--ctl-socket|-i|-S)
      _filedir
      return
      ;;
    -F|--ssh-config)
      COMPREPLY=($(compgen -W "none" -- "$cur"))
      _filedir
      return
      ;;
    -j|-J|--jumphost)
      _known_hosts_real -- "$cur"
      return
      ;;
    --port|--jport|--tunnel|--reversetunnel|-r|--keepalive|-k|-p|-L|-R|-D|--dynamic|-W|--stdio-forward|--disconnect-timeout|--verbose|--name|-e|--ssh-option)
      return
      ;;
    --attach|--kill)
      COMPREPLY=($(compgen -W "$(_et_session_names)" -- "$cur"))
      return
      ;;
    --username|-u|-l)
      COMPREPLY=($(compgen -u -- "$cur"))
      return
      ;;
    --command|-c)
      # -c is a cipher spec in 7.1+; only --command takes a command
      if [[ "$prev" == --command ]]; then
        COMPREPLY=($(compgen -c -- "$cur"))
      else
        COMPREPLY=($(compgen -W "$(ssh -Q cipher 2> /dev/null)" -- "$cur"))
      fi
      return
      ;;
    -O)
      COMPREPLY=($(compgen -W "check exit stop forward cancel" -- "$cur"))
      return
      ;;
    -o)
      compopt -o nospace 2> /dev/null
      COMPREPLY=($(compgen -W "ControlMaster= ControlPath= ControlPersist=
        ConnectTimeout= ServerAliveInterval= ServerAliveCountMax= Port=
        User= IdentityFile= ProxyJump= ForwardAgent= StrictHostKeyChecking=
        UserKnownHostsFile= LogLevel= Compression=" -- "$cur"))
      return
      ;;
  esac

  # -o Key=value completion; bash splits words at '=' so look back for the key
  local key=""
  if [[ "$cur" == *=* ]]; then
    key=${cur%%=*}
    cur=${cur#*=}
  elif [[ "$prev" == = && $cword -ge 3 ]]; then
    key=${words[cword - 2]}
  elif [[ "$cur" == = && $cword -ge 2 ]]; then
    key=$prev
    cur=""
  fi
  case "$key" in
    ControlMaster)
      COMPREPLY=($(compgen -W "yes auto no" -- "$cur"))
      return
      ;;
    ControlPersist)
      COMPREPLY=($(compgen -W "yes no" -- "$cur"))
      return
      ;;
    ControlPath)
      _filedir
      return
      ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "$_et_long_opts $_et_short_opts" -- "$cur"))
    return
  fi

  # Find whether the destination host was already given.
  local i w host_seen=0
  for ((i = 1; i < cword; i++)); do
    w=${words[i]}
    if [[ "$w" == -* ]]; then
      [[ "$_et_arg_opts" == *" $w "* ]] && ((i++))
    else
      host_seen=1
      break
    fi
  done

  if ((host_seen)); then
    # ssh-style positional command after the host
    COMPREPLY=($(compgen -c -- "$cur"))
  else
    _known_hosts_real -a -- "$cur"
  fi
}

complete -F _et et
