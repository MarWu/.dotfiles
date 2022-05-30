
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

tty=$(tty)
if [ "$tty" = "/dev/tty1" ]; then
	startx
fi

#eval "$(starship init bash)"
exec fish;
exit;
