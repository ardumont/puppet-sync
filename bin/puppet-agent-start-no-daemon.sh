#!/bin/bash -xe

sudo puppet agent --server=puppet.master.com --no-daemonize --verbose --debug $*
