#!/bin/bash -x

whoami

# sudo aptitude safe-upgrade -y

if [ ! -f ./puppetlabs-release-precise.deb ]; then
    # http://docs.puppetlabs.com/guides/puppetlabs_package_repositories.html
    wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
    sudo dpkg -i puppetlabs-release-precise.deb
    sudo apt-get update

    # workaround
    sudo aptitude install -y puppet puppetmaster facter
    sudo rm -rf /etc/puppet
    # see Vagrantfile for /etc/puppet-mount
    sudo ln -s /etc/puppet-mount /etc/puppet

    # restart the services
    sudo service puppetmaster restart
    sudo service puppet stop

    # synchronise the master with the agent once
    ./bin/puppet-agent-start-no-daemon.sh --debug
fi

# some special setup
grep "export TERM" $HOME/.bashrc
if [ ! $? = 0 ]; then
    echo -e "\nexport TERM=xterm" >> $HOME/.bashrc
fi
