#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export PYTHONUNBUFFERED=1

echo Running ansible playbooks as local
ansible-playbook $1/provisioning/playbooks.yml -i $1/provisioning/hosts.ini --extra-vars="target=development target_user=vagrant" --connection=local

