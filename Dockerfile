# syntax=docker/dockerfile:1
FROM docker.io/rockylinux/rockylinux:8
COPY ./init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh; \
    /tmp/init.sh; \
    rm /tmp/init.sh
USER steam
WORKDIR /home/steam/steamcmd
VOLUME [ "/home/steam/steamcmd" ]