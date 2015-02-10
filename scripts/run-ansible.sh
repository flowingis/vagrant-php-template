#!/bin/bash

echo Running ansible playbooks as local
ansible-playbook $1/provisioning/playbooks.yml -i $1/provisioning/hosts.ini --connection=local

