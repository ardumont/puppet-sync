#!/bin/bash

################################################################################
#
#
#               Entry point for the Puppet master ENC
#
#
################################################################################

WDIR="$(readlink -f "$(dirname "$0")")"
NODE="$1"
LOG_FILE="/tmp/puppet-enc.log"

CMD="$WDIR/enc-simple-file.sh $NODE"' 2>> '"$LOG_FILE"

echo "About to exec command: " >> "$LOG_FILE"
echo "$CMD"                    >> "$LOG_FILE"
echo "..."                     >> "$LOG_FILE"

bash -c "$CMD"
