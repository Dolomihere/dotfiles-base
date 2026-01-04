# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export STARSHIP_CACHE=/tmp/starship/cache
eval "$(starship init bash)"

# Dead simple transient prompt for bash
function lastcommand {
  history | tail -1 | cut -c 8-
}

function deleteprompt {
  n=${PS1@P}
  n=${n//[^$'\n']}
  n=${#n}
  tput cuu $((n + 1))
  tput ed
}

PS0="\[$(deleteprompt)\]▸ $(lastcommand)\n\[${PS1:0:$((EXPS0=1,0))}\]"

