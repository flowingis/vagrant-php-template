#!/bin/bash

echo Running ansible playbooks as local on CentOS
ansible-playbook $1/provisioning/playbooks.yml -i $1/provisioning/hosts.ini --extra-vars="target=staging target_user=vagrant" --connection=local

