#!/bin/bash

if [ -z "$STEAMID" ]; then
	echo "Cannot start: Please set STEAMID to a game/software id to install or replace the container's CMD."
	exit 1
fi

mkdir -p $INSTALLDIR
/home/steam/Steam/steamcmd.sh +login anonymous +force_install_dir $INSTALLDIR +app_update $STEAMID +exit