# Ideato Vagrant Machine

This is a Vagrant configuration designed for development of web applications
on LEMP (Linux, nginx, MySQL, PHP) stack.

The configuration is CentOs based and it will install:

* PHP 7
* MySQL 5.6
* nginx 1.10
* node 6.x
* Composer (latest)
* elasticsearch 2.x

## Requirements

* vagrant >= 1.6.3
* virtual box >= 4.3.10

## Usage

1. Duplicate the file `vagrant/vagrantconfig.dist.yml` into `vagrant/vagrantconfig.yml`.
2. Customize values into `vagrant/vagrantconfig.yml` to your needs.
3. Add your own custom configuration of vars within `vagrant/provisioning/host_vars/development.yml`. See [Configuration](#configuration) section for more info.
4. Run `vagrant up`.


## Configuration

The configuration automatically sets `synced_folder` and the first `host` you customized in `vagrantconfig.yml` as default _document root_ and _server name_ in nginx. In most of the projects this is a default set up, in this way you just need to update those values in a single file.

If you need to override one or more vars from `<ansible role>/defaults/main.yml` you just need to copy the var within the `vagrant/provisioning/host_vars/development.yml` and update with your value.

### Example

Suppose you customize your `vagrant/vagrantconfig.yml` as follow:

	ram:           2048
	cpus:          2
	ipaddress:     10.10.10.10
	name:          my-project-box
	synced_folder: "/var/www/my-project"
	hosts:
  		- my-project.dev
 		- api.my-project.dev

Once you provision the machine, automatically hosts will be added on your `hosts` file. Head your browser to `http://my-project.dev` address in order to open your project.


##To Do

### Main features

- [x] nginx + PHP 7
- [x] MySQL
- [x] node js
- [x] Elasticsearch

### Bugs and improvements

- [x] improve shell
- [ ] check if all needed PHP libraries are provided
- [ ] test with real project
