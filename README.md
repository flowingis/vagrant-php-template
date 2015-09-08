Requirements
============
- vagrant >= 1.6.3
- virtual box >= 4.3.10

Usage
=====

- clone repo
- insert your mysql info into provisioning/ideato.database.mysql/vars/main.yml
- insert apache and virtual host info into provisioning/ideato.webserver/vars/main.yml
- copy vagrantconfig.dist.yml in vagrantconfig.yml
- customize vagrantconfig.yml to your needs
(use hashicorp/precise64 as box for php 5.4 or ubuntu/trusty64 for php5.5 or php5.6)
- run "vagrant up"
- To use [adminer](http://www.adminer.org) go to: http://10.10.10.10/adminer

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
