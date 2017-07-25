#
# ~/.bashrc
#

[[ $- != *i* ]] && return # if not running interactively, don't do anything

shopt -s checkwinsize

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" &>/dev/null
fi

# Soft Dependencies:
# - git
# - python and pip 3.6.x
# - xclip
# - sublime-text-dev (AUR)

# git branch parser for PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e ' /^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# minimalist hostname-less prompt, with git repo if the current directory is one
PS1='\u:\w\[\e[0;32m\]$(parse_git_branch)\[\e[m\]$ '
# user:~$

# use Python 3.6 for *everything* by default
alias python='python3.6'
alias python3='python3.6'
alias pip='pip3.6'
alias pip3='pip3.6'

# network control shorthands
alias wm='sudo wifi-menu'
alias n='sudo netctl switch-to'
alias nr='sudo netctl restart'
alias nk='sudo netctl stop'

# general enhancements
alias dir='dir -A --group-directories-first --color=auto' # display hidden files
alias ls='ls --color=auto' # add color to output of ls
alias cls='clear' # add DOS-style cls shorthand
alias rmdir='rm -Irf' # shorthand to remove directory recursively
alias clip='xclip -sel c <' # usage: clip [file]
alias update='sudo pacman -Syu'

PATH=$PATH+':~/.cargo/bin' # add rust cargo binaries to PATH
