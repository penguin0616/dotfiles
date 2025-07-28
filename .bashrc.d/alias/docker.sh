#!/usr/bin/env bash
# https://gist.github.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb
alias d='docker'
alias dc='docker compose'
alias docker-remove-all-containers='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q);'