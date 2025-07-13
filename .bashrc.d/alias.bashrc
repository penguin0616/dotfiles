# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A' # List out "Almost all" (i.e. everything except . and ..)
alias l='ls -CF'
alias lh="ls -lh" # h: File size get simplified

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Miscellaneous
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/.git/ --work-tree=$HOME/dotfiles'
alias cls='clear'
alias taskkill="killall -s SIGKILL $*"  # https://askubuntu.com/questions/271028/killall-doesnt-kill-all-and-rarely-kills-what-is-the-command-for-then
alias check-venv='printf "import sys\nprint(\"Prefix:\", sys.prefix)" | py $1'
alias reload-bash='source ~/.bashrc'


# Load other aliases
if [ -d $SCRIPT_DIR/.bashrc.d/alias ]; then
    for rc in $SCRIPT_DIR/.bashrc.d/alias/*; do
        if [ -f "$rc" ]; then
            source "$rc"
        fi
    done
fi