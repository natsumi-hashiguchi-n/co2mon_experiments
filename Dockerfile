FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install systemd jq ca-certificates curl gpsd gpsd-clients && \
    rm -rf /var/lib/apt/lists/*

COPY . /workdir/

WORKDIR /workdir

COPY ./app/cm-read.service /etc/systemd/system/cm-read.service
RUN systemctl enable cm-read.service

COPY ./app/gpsd.service /etc/systemd/system/gpsd.service
RUN systemctl disable gpsd.socket
RUN systemctl enable gpsd.service

COPY ./app/cm-read-gps.service /etc/systemd/system/
RUN systemctl enable cm-read-gps.service

# 送信サービスの設定を行う

STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]
