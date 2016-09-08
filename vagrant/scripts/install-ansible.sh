#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export PYTHONUNBUFFERED=1

sudo yum check-update

printf '**************************\n\n'
printf 'Install cachefilesd'
printf '**************************\n\n'
# NFS improve caching
sudo yum -y install cachefilesd
sudo echo "RUN=yes" > /etc/default/cachefilesd
sudo /sbin/service cachefilesd start
printf '**************************\n\n'
printf 'Finish install  cachefilesd'
printf '**************************\n\n'

printf '**************************\n\n'
printf 'Install ansible'
printf '**************************\n\n'
sudo yum install -y python-pip python-dev python-pycurl
sudo yum check-update
if ! rpm -qa | grep -qw epel-release-7-8.noarch; then
    sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
fi
sudo yum -y check-update
sudo yum -y install ansible

sudo mkdir -p /etc/ansible

printf '**************************\n\n'
printf 'Removes executable permission on hosts.ini to avoid ansible evalute this inventory like external script'
chmod -x $1/provisioning/hosts.ini
printf '**************************\n\n'

printf '**************************\n\n'
printf 'Finish install ansible'
printf '**************************\n\n'
