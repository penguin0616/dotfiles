# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# 3.2.5.2 Conditional Constructs

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

##################################################
# Boilerplate
##################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Get current directory (https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script/246128#246128)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
##################################################
# Options & Configuration
##################################################

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin-1
shopt -s globstar

# globbing enabled
# [[ $- = *f* ]] && echo "yes" || echo "no"

#set -o noglob: This command enables globbing.
#set +o noglob: This command disables globbing.

# The /* has to be outside the string to be globbed.
# https://stackoverflow.com/questions/2437452/how-to-get-the-list-of-files-in-a-directory-in-a-shell-script

# To match files starting with . dotglob needs to be enabled.
# https://unix.stackexchange.com/questions/40662/what-is-the-setting-in-bash-for-globbing-to-control-whether-matches-dot-files


# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace
#export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

##################################################
# Tweaks
##################################################

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#	debian_chroot=$(cat /etc/debian_chroot)
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
 	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
  	fi
fi

##################################################
# Load other files
##################################################

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Dotfiles-specific aliases and functions
if [ -d $SCRIPT_DIR/.bashrc.d ]; then
    for rc in $SCRIPT_DIR/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Load other dotfiles.
#for file in ~/dotfiles/.{path,extra,bash_prompt,exports,bash_aliases}; do
#	if [ -f "$file" ] && [ -r "$file" ]; then
#		#echo $file;
#		source "$file";
#	fi
#done;

# Automatically use Python venv.
export VIRTUAL_ENV_DISABLE_PROMPT=1
if [ -d ~/.venv/default ]; then  # For some reason, using quotes makes it so it can't find .venv
	#echo "activating venv"
	source ~/.venv/default/bin/activate
	echo "" > /dev/null
else
	echo "Cannot find .venv" > /dev/null
fi

# Load Oh-my-posh theme.
eval "$(oh-my-posh init bash --config $SCRIPT_DIR/posh-themes/my_theme.json)"

unset SCRIPT_DIR
