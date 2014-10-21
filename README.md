Requirements
============
- vagrant >= 1.6.3
- virtual box >= 4.3.10

Usage
=====

- clone repo
- insert your mysql info into provisioning/ideato.database.mysql/vars/main.yml
- insert apachre and virtual host info into provisioning/ideato.webserver/vars/main.yml

This configuration install:
- php 5.5.x
- phpunit 4.3
- composer (latest)
- phing (latest)
- idephix (latest)
- apache 2.4.x
- mysql 5.5.x
