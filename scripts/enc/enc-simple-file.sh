#!/bin/sh

################################################################################
#
#
#       Entry point for the Puppet master ENC using simple files
#
#
################################################################################

#            "public" env vars, users can customize here
#            ===========================================

DATA_DIR="/usr/local/bin/enc/enc-data"

#                             functions
#                             =========

function log {
    NOW="$(date +%F-%Hh%Mm%Ss)"
    MSG="$*"
    echo "$NOW > $MSG" >&2
}

# Echo the given string on both stderr and stdout
function to_stdout_stderr {
    echo -e "$1" >&2
    echo -e "$1"
}

#                                main
#                                ====

log '----------------------------- ENC: begin ---------------------------------------'

NODE="$1"
WDIR="$(readlink -f "$(dirname "$0")")"
NODE_FILE=$DATA_DIR/$NODE.yaml

log "DATA_DIR  = $DATA_DIR"
log "NODE      = $NODE"
log "NODE_FILE = $NODE_FILE"

if [ ! -f $DATA_DIR/$NODE.yaml ];
then
    log "    No config found for this node, exiting now ..."
else
    log "    Found data for this file!"
    to_stdout_stderr "---"
    to_stdout_stderr "classes:"
    to_stdout_stderr "$(cat $DATA_DIR/$NODE.yaml)"
fi

log '------------------------------ ENC: end ----------------------------------------'
