# steamcmd

Barebone steamcmd in Ubuntu to create new images from

## Usage

### Envs
The following environment variables can be defined:

- `STEAMID=xyz` (**mandatory**): The steamid to install on startup. The id can be obtained from the search on https://steamdb.info.
- `INSTALLDIR=/xyz/` (default `/home/steam/game/`): The install directory of the steam app.

### Starting

The default entry point is configured to only install the desired app and exit immediately. This means you have two options to actually start the executable you want:

- You can use `docker commit CONTAINER NEWIMAGE` to create a new image and run with a different `--entrypoint=/bin/bash`. Note that this might be a useful thing to do anyway since typical steam downloads can reach sizes of dozens of GB and chances are you don't want to download all that data each and every time.
- You can depend your own Dockerfile on this one, call `/home/steam/Steam/install.sh` somewhere and define a proper `ENTRYPOINT`.