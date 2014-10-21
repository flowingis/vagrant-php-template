#!/bin/bash

echo Running ansible playbooks as local
ansible-playbook /var/www/provisioning/playbooks.yml -i /var/www/provisioning/hosts.ini --connection=local

