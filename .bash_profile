#   Filename: .bash_profile
# Maintainer: Wendell Medina
#

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
TERM=xterm-256color
export PATH TERM
