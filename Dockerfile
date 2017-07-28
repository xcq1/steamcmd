FROM ubuntu:latest
# sadly we cannot use Alpine here because of the 32bit libstdc++ dependency
LABEL maintainer="mail@tobiaskuhn.de"

ENV STEAMID ""
ENV INSTALLDIR "/home/steam/game/"

RUN apt update && \
	apt install -y lib32gcc1 curl && \
	apt clean

RUN useradd -m steam && \
	cd /home/steam && \
	mkdir Steam && \
	chown steam:steam Steam

USER steam
WORKDIR /home/steam/Steam
ADD install.sh /home/steam/Steam
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
	chmod u+x install.sh


CMD ["/home/steam/Steam/install.sh"]
