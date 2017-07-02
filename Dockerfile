FROM ubuntu:latest
# sadly we cannot use Alpine here because of the 32bit libstdc++ dependency
LABEL maintainer="mail@tobiaskuhn.de"

RUN apt update && \
	apt install -y lib32gcc1 curl && \
	apt clean
RUN mkdir steam && cd steam && \
	curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

CMD ["/steam/steamcmd.sh"]
