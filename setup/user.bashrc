# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f ~/dotfiles/.bashrc ]; then
    . ~/dotfiles/.bashrc
else
	echo "Cannot find dotfiles's bashrc"
fi
