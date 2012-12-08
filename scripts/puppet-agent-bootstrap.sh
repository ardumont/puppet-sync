#!/bin/bash -x

whoami

#sudo /etc/init.d/network restart

sudo apt-get install -y puppet facter dnsmasq bind-utils

echo "nameserver 127.0.0.1" > /etc/resolv.conf
echo "nameserver 10.0.2.3" >> /etc/resolv.conf

echo "127.0.0.1               puppet localhost.localdomain localhost" > /etc/hosts
echo "192.168.33.10           puppet.master.com" >> /etc/hosts
echo "192.168.33.11           puppet.agent.com" >> /etc/hosts
echo "::1             localhost6.localdomain6 localhost6" >> /etc/hosts

#service dnsmasq restart

# some special setup
grep "export TERM" /home/vagrant/.bashrc
if [ ! $? = 0 ]; then
    echo -e "\nexport TERM=xterm" >> /home/vagrant/.bashrc
fi
