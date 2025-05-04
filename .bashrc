# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# 3.2.5.2 Conditional Constructs

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

# Load other dotfiles.
for file in ~/dotfiles/.{path,extra,bash_prompt,exports,bash_aliases}; do
	if [ -f "$file" ] && [ -r "$file" ]; then
		#echo $file;
		source "$file";
	fi
done;

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

for extra in ~/dotfiles/extras/*
do
	source "$extra"
done

unset extra;

export VIRTUAL_ENV_DISABLE_PROMPT=1
if [ -d "~/.venv/default" ]; then
	source ~/.venv/default/bin/activate
fi
