####Table of Contents

1. [Requirements] (#requirements)
2. [Development Usage] (#development-usage)
	* [PHP version] (#choose-the-php-version)
3. [Continuous Delivery Usage] (#continuous-delivery-usage)

Requirements
============
- vagrant >= 1.6.3
- virtual box >= 4.3.10

Development Usage
=====

- clone repo
- insert your mysql info into provisioning/ideato.database.mysql/vars/main.yml
- insert apache and virtual host info into provisioning/ideato.webserver/vars/main.yml
- copy vagrantconfig.dist.yml in vagrantconfig.yml
- customize vagrantconfig.yml to your needs
(use hashicorp/precise64 as box for php 5.4 or ubuntu/trusty64 for php5.5 or php5.6)
- run "vagrant up"
- To use phpmyadmin go to: http://10.10.10.10/phpmyadmin

## Choose the PHP version

To install php5.4:

- choose hashicorp/precise64 as box

To install php5.5 or php5.6:

- choose ubuntu/trusty64 as box
- choose the php version ppa in provisioning/ideato.webserver/vars/main.yml


This configuration install:

- php 5.x
- phpunit 4.3
- composer (latest)
- phing (latest)
- idephix (latest)
- apache 2.4.x
- mysql 5.5.x

## Composer Auth Token

In `provisioning/ideato.webserver/vars/main.yml` you can add a GitHub access token.
Head to https://github.com/settings/tokens and generate your own access token, then
assign it to the `composer_github_oauth` variable.

Continuous Delivery Usage
=====

You can also use vagrant-php-template as a ***Continuous Delivery*** instrument.
We found three stages on our deployment pipeline and mapped on the template using Vagrant and Ansible for dev environment and stage & production just Ansible.
You can provision Debian or RedHat staging/production env, on next release you can also setup a RedHat development environment

Some requirements:

- ***staging and production env must exists***
- ***ansible works with ssh***, I will give more details below

A possible workflow is:

1. provision your dev environment using Vagrant
2. when you had tested and completed your feature inside your dev environment you can start provision a stage environment and push on it

Following the Jez Humble Continuous Delivery book, we also thought is a good idea to not distinguish a staging or production environment. A staging environment is a production like environment.

When you have tested your feature, you are ready to push on staging env, to this follow these instructions:

1. please edit hosts.ini for stage and prod env( for i.e) 
	
		[production]
		192.168.1.1
		[staging]
		192.168.1.2

2. please edit host\_vars/staging.yml and host_vars/production.yml and set variables like a common dev usage

3. to provision with Ansible:

	- require ssh connection
	- use an existing or generate a new private key( ssh-keygen -t rsa -b 4096 -f continuous_dev.pem)
	- ssh-copy-id -i ~.ssh/<yourkey> <remote user>@<remote ip>
	- do a test: ssh \<remote user>@\<remote ip>
	- launch on staging

		```
		ansible-playbook  ---i vagrant/provisioning/hosts.ini --vault-password-file vagrant/provisioning/playbooks.yml --extra-vars "target=staging target_user=<your remote user> target_vars=host_vars/staging.yml" -vv
		
		```
		```
		ansible-playbook --become-user=<your remote user> -i vagrant/provisioning/hosts.ini --vault-password-file vagrant/provisioning/playbooks.yml --extra-vars "target=production target_user=<your remote user> target_vars=host_vars/production.yml" -vv
		```
		
Probably you might think this is a bit tricky but in a Continuous Integration server you can easily setup a shell command for Ansible run.
