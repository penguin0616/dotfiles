#!/usr/bin/env bash
# Valve's wiki (https://developer.valvesoftware.com/wiki/SteamCMD#Linux) for SteamCmd suggested using "cm2network"'s steamcmd, which I was not interested in.
# I did look some more and found this, so I'm not sure why the former is suggested in the first place.
# https://github.com/steamcmd/docker
alias steamcmd="podman run -it --name=steamcmd --entrypoint /usr/bin/steamcmd --rm docker.io/steamcmd/steamcmd:latest"
