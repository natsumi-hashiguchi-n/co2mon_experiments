FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install jq ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*
#RUN update-ca-certificates

COPY . /workdir/

WORKDIR /workdir

#VOLUME ["/workdir/DATA", "/workdir/TMP"]
#VOLUME ["/workdir/CONF", "/workdir/TMP"]

CMD /workdir/app/main.sh
