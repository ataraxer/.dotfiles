# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

shopt -s extglob

force_color_prompt=yes
color_prompt=yes

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
# alias ls='ls --color=auto'
alias ll='ls -ohG'
alias la='ls -oAhG'
alias l='ls -CFG'

alias lisp='clisp --silent'

alias proj='cd ~/Documents/Projects'
alias src='cd ~/Documents/Sources'

if [ -d ~/.aliases ]; then
	. ~/.aliases/*
fi

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

if [ -d /usr/local/etc/bash_completion.d ]; then
	. /usr/local/etc/bash_completion.d/*
fi


# . /home/ataraxer/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
alias tree="find . -print | grep -v '.git' | sort | sed 's;[^/]*/;|-- ;g;s;-- |; |;g'"

export HOMEBREW_NO_EMOJI=True
export TERM="xterm-256color"
export LSCOLORS="Dxfxcxdxcxegedabagacad"

export PGHOST=localhost
