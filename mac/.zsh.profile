# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

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
alias ta='tmux attach'

if [ -d ~/.aliases ]; then
	. ~/.aliases/*
fi

# . /home/ataraxer/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
alias tree="find . -print | grep -v '.git' | sort | sed 's;[^/]*/;|-- ;g;s;-- |; |;g'"

export HOMEBREW_NO_EMOJI=True
export TERM="xterm-256color"
export LSCOLORS="Dxfxcxdxcxegedabagacad"

export PGHOST=localhost
