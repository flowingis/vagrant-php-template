#!/bin/bash

sudo yum install -y epel-release >/dev/null 2>&1
sudo yum install -y python-pip python-dev python-pycurl >/dev/null 2>&1
sudo yum install -y ansible >/dev/null 2>&1
sudo mkdir -p /etc/ansible >/dev/null 2>&1

