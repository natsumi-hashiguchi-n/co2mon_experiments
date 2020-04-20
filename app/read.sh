#!/bin/sh

echo "read.sh started" >&2

# rotateは別プロセスで
log_dir="/var/local/co2mon/DATA/log/co2"
log="${log_dir}/latest"

mkdir -p "${log_dir}"

stty -F /dev/ttyACM0 raw 9600

cat /dev/ttyACM0 |
while read -r l; do
  printf '%s %s\n' "$(date +%s)" "${l}"
done >> "${log}"
