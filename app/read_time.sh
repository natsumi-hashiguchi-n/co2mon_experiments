#!/bin/sh

echo "read_time.sh started" >&2


log_dir="/var/local/co2mon/DATA/log/time"
log="${log_dir}/latest"

mkdir -p "${log_dir}"


printf '%s\n' "$(date +%s)" >> "${log}"
