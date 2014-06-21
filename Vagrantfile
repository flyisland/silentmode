# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "admin" , primary: true do |admin|
    admin.vm.box = "oel65-64"

    admin.vm.hostname = "admin.example.com"
    admin.vm.synced_folder "e:/OFM", "/software"

    admin.vm.network "private_network", ip: "10.10.10.10"
  
    admin.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--name", "admin"]
    end
    
  end
end
