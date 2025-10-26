# Simple transient prompt for bash
delete_first_line() {
  tput cuu 2
  tput ed
}

last_command() { 
  history 1 | sed 's/ *[0-9]\+ *//'
}

PS0='\[$(delete_first_line)\]▸ $(last_command)\n'
