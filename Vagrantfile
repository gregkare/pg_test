# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.define 'default', primary: true do |default_config|
    default_config.vm.provision :chef_zero do |chef|
      chef.version                            = '15.3.14'
      chef.arguments                          = "--chef-license accept"
      chef.cookbooks_path                     = ['cookbooks', 'site-cookbooks']
      chef.node_name                          = "vagrant-node"
      chef.nodes_path                         = 'nodes'
      chef.add_recipe 'pg_test'
    end
  end
end
