#   Filename: .profile
# Maintainer: Wendell Medina
#

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
[ -z "$TMUX" ] && export TERM=xterm-256color
export PATH TERM
mesg n
