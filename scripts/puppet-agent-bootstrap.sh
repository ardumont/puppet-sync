#!/bin/bash -x

whoami

sudo apt-get install -y puppet facter

# some special setup
grep "export TERM" /home/vagrant/.bashrc
if [ ! $? = 0 ]; then
    echo -e "\nexport TERM=xterm" >> /home/vagrant/.bashrc
fi
