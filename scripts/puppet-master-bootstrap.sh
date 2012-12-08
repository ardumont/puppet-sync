#!/bin/bash -x

whoami

# install puppet master and agent
sudo apt-get install -y puppet puppetmaster facter

# some special setup
grep "export TERM" $HOME/.bashrc
if [ ! $? = 0 ]; then
    echo -e "\nexport TERM=xterm" >> $HOME/.bashrc
fi
