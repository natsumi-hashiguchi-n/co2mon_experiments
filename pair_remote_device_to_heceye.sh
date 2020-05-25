#!/bin/sh

target="${1}"
pairing_url="${2}"

set -eu
: ${target}
: ${pairing_url}

ssh "${target}" "docker run --rm -v /var/local/co2mon:/var/local/co2mon co2mon sh -c '/workdir/app/get_endpoint_info.sh \"${pairing_url}\" > /var/local/co2mon/DATA/endpoint_info; cat /var/local/co2mon/DATA/endpoint_info'"
#ssh "${target}" "docker run --rm -v /var/local/co2mon:/var/local/co2mon co2mon sh -c '/workdir/app/get_endpoint_info.sh \"${pairing_url}\"'"
