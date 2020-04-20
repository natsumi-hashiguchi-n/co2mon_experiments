#!/bin/sh

#
# pvのインストール:
#   brew install pv
#

TARGET_HOST="cm01.local"
CONTAINER_NAME="co2mon"

pv --version > /dev/null || (echo "pvが見当たりません" >&2; exit 1)

./docker_build.sh &&
  (docker image save co2mon |
    pv |
    ssh "${TARGET_HOST}" docker image load) &&
  ssh "${TARGET_HOST}" '
    docker stop '"${CONTAINER_NAME}"';
    docker run -d --privileged --rm -v /var/local/co2mon:/var/local/co2mon --name '"${CONTAINER_NAME}"' co2mon /sbin/init'
