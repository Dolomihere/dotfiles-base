# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export STARSHIP_CACHE=/tmp/starship/cache
eval "$(starship init bash)"

# Simple transient prompt for bash
delete_first_line() {
  tput cuu 2
  tput ed
}

last_command() { 
  history 1 | sed 's/ *[0-9]\+ *//'
}

PS0='\[$(delete_first_line)\]▸ $(last_command)\n'

