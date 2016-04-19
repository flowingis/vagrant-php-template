#!/bin/bash

ansible-playbook $1/provisioning/playbooks.yml -i $1/provisioning/hosts.ini --extra-vars="target=development target_user=vagrant" --connection=local

