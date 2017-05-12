# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.define "master1" do |master1|
    master1.vm.box = "bento/ubuntu-16.04"
    master1.vm.hostname = 'master1'
    master1.vm.provision "shell", path: "setup.sh"
    master1.vm.box_url = "bento/ubuntu-16.04"
    master1.vm.network :private_network, ip: "192.168.56.101"
    master1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 4000]
      v.customize ["modifyvm", :id, "--name", "master1"]
    end
  end

  config.vm.define "master2" do |master2|
    master2.vm.box = "bento/ubuntu-16.04"
    master2.vm.hostname = 'master2'
    master2.vm.provision "shell", path: "setup.sh"
    master2.vm.box_url = "bento/ubuntu-16.04"
    master2.vm.network :private_network, ip: "192.168.56.102"
    master2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 4000]
      v.customize ["modifyvm", :id, "--name", "master2"]
    end
  end

  config.vm.define "node1" do |node1|
    node1.vm.box = "bento/ubuntu-16.04"
    node1.vm.hostname = 'node1'
    node1.vm.provision "shell", path: "setup.sh"
    node1.vm.box_url = "bento/ubuntu-16.04"
    node1.vm.network :private_network, ip: "192.168.56.103"
    node1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1000]
      v.customize ["modifyvm", :id, "--name", "node1"]
    end
  end

  config.vm.define "launcher" do |launcher|
    launcher.vm.box = "bento/ubuntu-16.04"
    launcher.vm.hostname = 'launcher'
    launcher.vm.provision "shell", path: "setup.sh"
    launcher.vm.box_url = "bento/ubuntu-16.04"
    launcher.vm.network :private_network, ip: "192.168.56.105"
    launcher.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 500 ]
      v.customize ["modifyvm", :id, "--name", "config"]
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "bento/ubuntu-16.04"
    node2.vm.hostname = 'node2'
    node2.vm.provision "shell", path: "setup.sh"
    node2.vm.box_url = "bento/ubuntu-16.04"
    node2.vm.network :private_network, ip: "192.168.56.104"
    node2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1000 ]
      v.customize ["modifyvm", :id, "--name", "node2"]
    end
  end


end
