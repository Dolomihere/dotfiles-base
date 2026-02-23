# .bash_profile

# Get the aliases and functions
export STARSHIP_CACHE=/tmp/starship
export NO_AT_SPI=1

export IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

[ -f "$HOME"/.bashrc ] && . "$HOME"/.bashrc

if [ -e /home/dolomi/.nix-profile/etc/profile.d/nix.sh ]; then 
  . /home/dolomi/.nix-profile/etc/profile.d/nix.sh; 
fi # added by Nix installer

if [[ "$(tty)" = "/dev/tty1" ]]; then
  set -m

  dbus-run-session -- niri --session > /dev/null 2>&1 &

  SESSION_PGID=$!
  trap 'kill -TERM -${SESSION_PGID} 2>/dev/null' EXIT
  wait ${SESSION_PGID}
  kill -TERM -${SESSION_PGID} > /dev/null 2>&1

  pkill -u "${USER}" -f "xdg-desktop-portal|at-spi|battery-warn|swayidle|swaybg" > /dev/null 2>&1
  pkill -u "${USER}" -x dbus-daemon > /dev/null 2>&1

  sleep 0.3

  logout
fi

