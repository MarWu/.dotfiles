
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
PS1='[\u@\h \W]\$ '

tty=$(tty)
if [ "$tty" = "/dev/tty1" ]; then
	startx
fi

#eval "$(starship init bash)"
# exec fish;
# exit;
. "$HOME/.cargo/env"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
