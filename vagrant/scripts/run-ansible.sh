#!/bin/bash

echo Running ansible playbooks as local
ansible-playbook $1/vagrant/playbooks.yml -i $1/vagrant/env/dev/hosts.ini --extra-vars "synced_folder=$1 host=$2 env=dev" --connection=local
