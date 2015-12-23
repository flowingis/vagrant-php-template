#!/bin/bash

if [ -f /etc/centos-release]; then

	export PYTHONUNBUFFERED=1
	yum install wget
	wget https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
	sudo yum -y install epel-release-7-5.noarch.rpm
	sudo yum --enablerepo="epel"
	sudo yum update

	printf '**************************\n\n'
	printf 'Install cachefilesd'
	printf '**************************\n\n'
	#NFS improve caching
	sudo yum -y install cachefilesd
	sudo echo "RUN=yes" > /etc/default/cachefilesd
	sudo service cachefilesd start
	printf '**************************\n\n'
	printf 'Finish install  cachefilesd'
	printf '**************************\n\n'

	printf '**************************\n\n'
	printf 'Install ansible'
	printf '**************************\n\n'
	sudo yum install -y python-pip python-devel python-pycurl ansible
	sudo mkdir -p /etc/ansible

	printf '**************************\n\n'
	printf 'Removes executable permission on hosts.ini to avoid ansible evalute this inventory like external scritp'
	chmod -x $1/provisioning/hosts.ini
	printf '**************************\n\n'

	printf '**************************\n\n'
	printf 'Finish install ansible'
	printf '**************************\n\n'

else 

	export DEBIAN_FRONTEND=noninteractive
	export PYTHONUNBUFFERED=1

    sudo apt-get update

	printf '**************************\n\n'
	printf 'Install cachefilesd'
	printf '**************************\n\n'
	# NFS improve caching
	sudo apt-get install cachefilesd
	sudo echo "RUN=yes" > /etc/default/cachefilesd
	sudo service cachefilesd start
	printf '**************************\n\n'
	printf 'Finish install  cachefilesd'
	printf '**************************\n\n'

	printf '**************************\n\n'
	printf 'Install ansible'
	printf '**************************\n\n'
	sudo apt-get install -y python-pip python-dev python-pycurl
	sudo pip install ansible

	sudo mkdir -p /etc/ansible

	printf '**************************\n\n'
	printf 'Removes executable permission on hosts.ini to avoid ansible evalute this inventory like external scritp'
	chmod -x $1/provisioning/hosts.ini
	printf '**************************\n\n'

	printf '**************************\n\n'
	printf 'Finish install ansible'
	printf '**************************\n\n'
fi
