#!/usr/bin/env bash
# Valve's wiki (https://developer.valvesoftware.com/wiki/SteamCMD#Linux) for SteamCmd suggested using "cm2network"'s steamcmd, which I was not interested in.
# I did look some more and found this, so I'm not sure why the former is suggested in the first place.
# https://github.com/steamcmd/docker
# docker run -it -v $PWD:/data steamcmd/steamcmd:latest +login anonymous +force_install_dir /data +app_update 740 +quit
#alias steamcmd="podman run -it --name=steamcmd --entrypoint /usr/bin/steamcmd --rm docker.io/steamcmd/steamcmd:latest"

function steamcmd() {
    # Create necessary directories
    mkdir -p /tmp/steamcmd/data
	mkdir -p /tmp/steamcmd/content
    
    # Run podman command, passing all arguments from the function call
    podman run -it --rm \
        --name=steamcmd \
        --entrypoint /usr/bin/steamcmd \
        -v /tmp/steamcmd/data:/data:z \
        -v /tmp/steamcmd/content:/root/.local/share/Steam/steamapps/workshop/content:z \
        docker.io/steamcmd/steamcmd:latest \
        +force_install_dir /data \
        "$@"
}


