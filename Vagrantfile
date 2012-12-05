Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.define :vm1 do |vm1_config|
    vm1_config.vm.box = "lucid32"
    vm1_config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
#    vm1_config.vm.boot_mode= :gui
    vm1_config.vm.customize ["modifyvm", :id,  "--natdnshostresolver1", "on", "--memory", 512]
    vm1_config.vm.network :hostonly, "192.168.33.10"
    vm1_config.vm.host_name = "puppet.master.com"
#    vm1_config.vm.share_folder "v-data-1", "~/bin", "~vagrant/bin"
#    vm1_config.vm.provision :shell, :path => "~/bin/puppet/puppet-master-bootstrap.sh"
  end
end
