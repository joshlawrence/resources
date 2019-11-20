# ~/.bash_profile

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is not interactive
	return
fi

# default prompt
PS1=" \w \$ "

# don't put duplicate lines or lines starting with space in the history
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# Make bash check its window size after a process completes
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# path
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# editor
export VISUAL=vim
export EDITOR="$VISUAL"

# aliases
# quoting is HARD
alias afk='pmset displaysleepnow'
alias cleanup="find . -type f -name '.DS_Store' -print -delete"
alias gam="$HOME/bin/gam/gam"
alias ls='ls -1G'
alias tb='nc termbin.com 9999'
alias getip='curl http://icanhazip.com'
alias upload='open https://send.firefox.com/'

# source ~/.bash_aliases if it exists
#if [ -f ~/.bash_aliases ]; then
#  source ~/.bash_aliases
#fi

# functions
timestamp () {
  date +"%F %r" | tr -d "\n" | pbcopy
}

dtree () {
  tree -h -C -L 1 "$1"
}

pman () {
  man -t "$1" | open -fa /Applications/Preview.app
}

reload () {
  unalias -a
  source "$HOME/.bash_profile"
}

genpass () {
  pwgen -N "$1" -cn -1 12
}

# completion
test -e "$HOME/.iterm2_shell_integration.bash" && source "$HOME/.iterm2_shell_integration.bash"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# source ~/.bashrc if it exists
#if [ -f ~/.bashrc ]; then
#  source ~/.bashrc
#fi 