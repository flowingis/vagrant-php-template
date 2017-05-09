# Ideato Vagrant Machine

This is a Vagrant configuration designed for development of web applications
on LEMP (Linux, nginx, MySQL, PHP) stack.

The configuration is CentOs based and it will install:

* PHP 7
* MySQL 5.6
* nginx 1.10
* node default installation 7.x
* elasticsearch default installation 5.x 

## Requirements

* vagrant >= 1.8.6
* virtual box >= 5.1.8

## Usage

1. Duplicate the file `vagrant/vagrantconfig.dist.yml` into `vagrant/vagrantconfig.yml`.
2. Customize values into `vagrant/vagrantconfig.yml` to your needs.
3. Add your own custom configuration of vars within `vagrant/env/dev/all.yml`. See [Configuration](#configuration) section for more info.
4. Run `vagrant up`.


## Configuration

The configuration automatically sets the first `host` you customized in `vagrantconfig.yml` as default _server name_ in nginx.
In most of the projects this is a default set up, in this way you just need to update those values in a single file.

If you need to override one or more vars, you have to edit `vagrant/env/dev/all.yml` and update with your value.

### Example

Suppose you customize your `vagrant/env/dev/all.yml` as follow:

	user: vagrant
	backend_server_name_virtual_host: "{{ host }}"
	backend_application_root_dir: /var/www/web
	nodejs_version: "7.x"
	mysql_user: ideato
	mysql_password: ideato
	mysql_db: ideato
	mysql_root_password: root
	es_major_version: "5.x"

and you customize your `vagrant/vagrantconfig.yml` as follow:

	ram:           2048
	cpus:          2
	ipaddress:     10.10.10.10
	name:          my-project-box
	synced_folder: "/var/www"
	hosts:
  		- my-project.dev
 		- api.my-project.dev

Once you provision the machine, automatically hosts will be added on your `hosts` file. Head your browser to `http://my-project.dev` address in order to open your project with `/var/www/web` as document root

## Known issue

If you have trouble with the ssh connection after vagrant please run:
- rm -f /etc/exports
- Open VirtualBox, go to Preferenze -> Rete -> Reti solo host and removed vboxnet* 
