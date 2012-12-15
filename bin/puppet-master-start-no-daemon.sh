#!/bin/bash -xe

sudo puppet master --verbose --no-daemonize $*
