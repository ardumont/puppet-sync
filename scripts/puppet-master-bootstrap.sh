#!/bin/bash -x

whoami

# puppet installation once
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
fi

# some special setup
grep "export TERM" $HOME/.bashrc
if [ ! $? = 0 ]; then
    echo -e "\nexport TERM=xterm" >> $HOME/.bashrc
fi

# restart the puppetmaster services to take the puppet installation into account
sudo service puppetmaster stop
# stop the agent service
sudo service puppet stop

# to synchronize the master with the agent once
~/bin/puppet-master-start-no-daemon.sh --debug &

# let some time for the master to start
sleep 3

# to synchronize the master with the agent once
~/bin/puppet-agent-start-no-daemon.sh --debug --onetime
