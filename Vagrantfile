# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

# Load up our vagrant config files -- vagrant/vagrantconfig.yml first
_config = YAML.load(File.open(File.join(File.dirname(__FILE__), "vagrant/vagrantconfig.yml"), File::RDONLY).read)
CONF = _config

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_check_update = false
  config.vm.box = "bento/centos-7.2"
  config.vm.hostname = CONF["name"]
  config.vm.network "private_network", ip: CONF["ipaddress"]

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.ssh.forward_agent = true

  unless Vagrant.has_plugin?("vagrant-hostsupdater")
    raise 'vagrant-hostsupdater plugin not installed, run "vagrant plugin install vagrant-hostsupdater"'
  end

  config.hostsupdater.remove_on_suspend = true
  config.hostsupdater.aliases = CONF['hosts']

  config.vm.synced_folder "./", CONF["synced_folder"], type: "nfs", mount_options: ['rw', 'nolock', 'vers=3', 'tcp', 'fsc', 'actimeo=2']

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", CONF["ram"]]
    vb.customize ["modifyvm", :id, "--cpus", CONF["cpus"]]
  end

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = CONF["ram"]
    v.vmx["numvcpus"] = CONF["cpus"]
  end

  config.vm.provision :shell, :path => "vagrant/scripts/install-ansible.sh", :args => File.join(CONF["synced_folder"], "vagrant")
  config.vm.provision :shell, :path => "vagrant/scripts/run-ansible.sh", :args => [
    CONF["synced_folder"],
    CONF["hosts"].first,
  ]
end
