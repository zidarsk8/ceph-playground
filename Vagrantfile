# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "master" do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.hostname = "master"
    node.vm.network "public_network", bridge: "enp3s0"
  end
  
  N = 5
  (1..N).each do |node_id|
    config.vm.define "node#{node_id}" do |node|
      node.vm.box = "ubuntu/xenial64"
      node.vm.hostname = "node#{node_id}"
      node.vm.network "public_network", bridge: "enp3s0"
      # node.vm.network "public_network", ip: "192.168.1.#{50+node_id}"

      # Only execute once the Ansible provisioner,
      # when all the nodes are up and ready.
      if node_id == N
        node.vm.provision :ansible do |ansible|
          # Disable default limit to connect to all the nodes
          ansible.limit = "all"
          ansible.verbose = true
          ansible.playbook = "provision/playbook.yml"
        end
      end
    end
  end
end
