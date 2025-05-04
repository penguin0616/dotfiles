#!/usr/bin/env bash

# Create a new directory and enter it 
function mkd() {
	mkdir -p "$@" && echo "$_";
}


function tre() {
	tree -aC -I '.git|.dotfiles|.cache|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}