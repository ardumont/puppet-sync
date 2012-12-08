# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.define :vm1 do |vm1_config|
    vm1_config.vm.box = "precise32"
    vm1_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
#    vm1_config.vm.boot_mode= :gui
    vm1_config.vm.customize ["modifyvm", :id,  "--natdnshostresolver1", "on", "--memory", 512]
    vm1_config.vm.network :hostonly, "192.168.33.10"
    vm1_config.vm.host_name = "puppet.master.com"
    vm1_config.vm.share_folder "v-data-1", "/etc/puppet/", "./UNIX_ROOT/etc/puppet/"
    vm1_config.vm.share_folder "v-data-2", "/home/vagrant/bin", "./scripts"
    vm1_config.vm.share_folder "v-data-3", "/usr/local/bin/enc", "./scripts/enc"
    vm1_config.vm.provision :shell, :path => "./scripts/puppet-master-bootstrap.sh"
  end

  config.vm.define :vm2 do |vm2_config|
    vm2_config.vm.box = "precise32"
    vm2_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    vm2_config.vm.customize ["modifyvm", :id,  "--natdnshostresolver1", "on", "--memory", 512]
    vm2_config.vm.network :hostonly, "192.168.33.11"
    vm2_config.vm.host_name = "puppet.agent.com"
    vm2_config.vm.share_folder "v-data-1", "/home/vagrant/bin", "./scripts"
    vm2_config.vm.provision :shell, :path => "./scripts/puppet-agent-bootstrap.sh"
  end
end
