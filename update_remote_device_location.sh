#!/bin/sh

#
# location書式:
#   lat,lng,alt
# 例:
#   35.73237,139.76728,0
#

target="${1}"
location="${2}"

set -eu
: ${target}
: ${location}

ssh "${target}" "sudo mkdir -p /var/local/co2mon/DATA && echo \"${location}\" | sudo tee /var/local/co2mon/DATA/location"
