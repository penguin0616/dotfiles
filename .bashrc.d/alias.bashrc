#!/usr/bin/env bash
# This file is where I keep the more "miscellaneous" aliases and load the other alias files.

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Miscellaneous
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/.git/ --work-tree=$HOME/dotfiles'
alias cls='clear' # I'm too used to Windows, plus it's shorter.
alias taskkill="killall -s SIGKILL $*"  # https://askubuntu.com/questions/271028/killall-doesnt-kill-all-and-rarely-kills-what-is-the-command-for-then
alias check-venv='printf "import sys\nprint(\"Prefix:\", sys.prefix)" | py $1'
alias reload-bashrc='source ~/.bashrc' # Inefficiency :(
alias clip='xsel --clipboard'


# Load other aliases
if [ -d $SCRIPT_DIR/.bashrc.d/alias ]; then
    for rc in $SCRIPT_DIR/.bashrc.d/alias/*; do
        if [ -f "$rc" ]; then
            source "$rc"
        fi
    done
fi