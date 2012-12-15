#!/bin/bash -xe

sudo puppet master --no-daemonize --verbose --debug $*
