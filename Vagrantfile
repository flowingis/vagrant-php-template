# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

# Load up our vagrant config files -- vagrantconfig.yml first
_config = YAML.load(File.open(File.join(File.dirname(__FILE__), "vagrantconfig.yml"), File::RDONLY).read)
CONF = _config

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/precise64"

  config.vm.network "private_network", ip: CONF["ipaddress"]

  config.ssh.forward_agent = true

  config.vm.synced_folder "./", "/var/www", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc']

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", CONF["ram"]]
    vb.customize ["modifyvm", :id, "--cpus", CONF["cpus"]]
    vb.customize ["modifyvm", :id, "--name", CONF["name"]]
  end

  config.vm.provision :shell, :path => "scripts/install-ansible.sh", :args => "/var/www"
  config.vm.provision :shell, :path => "scripts/run-ansible.sh", :args => "/var/www"

end
