FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install systemd jq ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

COPY . /workdir/

WORKDIR /workdir

COPY ./app/cm-read.service /etc/systemd/system/cm-read.service
RUN systemctl enable cm-read.service

STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]
