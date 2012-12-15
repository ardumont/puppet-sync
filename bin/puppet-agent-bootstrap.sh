#!/bin/bash -x

whoami

# puppet installation once
if [ ! -f ./puppetlabs-release-precise.deb ]; then
    # http://docs.puppetlabs.com/guides/puppetlabs_package_repositories.html
    wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
    sudo dpkg -i puppetlabs-release-precise.deb
    sudo apt-get update

    # workaround
    sudo apt-get install -y puppet facter chkconfig

    # stop the puppet agent service
    sudo service puppet stop

    sudo chkconfig puppet off
fi

# some special setup
grep "export TERM" /home/vagrant/.bashrc
if [ ! $? = 0 ]; then
    echo -e "\nexport TERM=xterm" >> /home/vagrant/.bashrc
fi

~/bin/puppet-agent-start-no-daemon.sh --debug --onetime
