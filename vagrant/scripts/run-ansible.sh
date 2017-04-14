#!/bin/bash

echo Running ansible playbooks as local
ansible-playbook $1/vagrant/provisioning/playbooks.yml -i $1/vagrant/provisioning/hosts.ini --extra-vars "synced_folder=$1 host=$2" --connection=local
