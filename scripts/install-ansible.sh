#!/bin/bash

sudo apt-get update
# NFS improve caching
sudo apt-get install cachefilesd
sudo echo "RUN=yes" > /etc/default/cachefilesd
sudo service cachefilesd start
sudo apt-get install -y python-pip python-dev python-pycurl
sudo pip install ansible

sudo mkdir -p /etc/ansible
#printf '**************************\n\n'
#printf '[vagrant]\nlocalhost\n' | sudo tee /etc/ansible/hosts > /dev/null
#printf '**************************\n\n'

if [[ ! -d /.vm-stuff ]]; then
    mkdir /.vm-stuff
    printf '**************************\n\n'
    printf "Created directory /.vm-stuff"
    printf '**************************\n\n'
fi

if [[ ! -f /.vm-stuff/add-ssh-key ]]; then
    printf '**************************\n\n'
    printf 'ssh key gen\n'
    printf '**************************\n\n'

    ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""
    touch /.vm-stuff/add-ssh-key
fi

printf '**************************\n\n'
printf 'Removes executable permission on hosts.ini to avoid ansible evalute this inventory like external scritp'
chmod -x /var/www/provisioning/hosts.ini
printf '**************************\n\n'


printf '**************************\n\n'
printf 'Finish controlhost provisioning'
printf '**************************\n\n'
