#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with spacewalk](#setup)
    * [What spacewalk affects](#what-spacewalk-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with spacewalk](#beginning-with-spacewalk)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Installs and configures Spacewalk Server and Client.

## Module Description

This module installs and configures Spacewalk server, it can also be used to install the spacewalk client.

## Setup

### What spacewalk affects

* A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form. 

### Beginning with spacewalk

To start using spacewalk you need to setup:

* A Spacewalk server
* A Spacewalk client
* Configure a Software Channel and Repositories

A minimal example might be:

~~~
  class {'::spacewalk':
    db_pass         => 'ChangeMePlease',
    admin_email     => 'ops@conpany.com',
    ca_cert_pass    => 'ChangeMeTwo',
    ca_org          => 'Ops',
  }
~~~


## Usage

### Installing a Spacewalk Server

~~~
  class {'::spacewalk':
    db_pass         => 'ChangeMePlease',
    admin_email     => 'ops@company.com',
    ca_cert_pass    => 'ChangeMeTwo',
    ca_org          => 'Ops',
    ca_city         => 'Los Angeles',
    ca_state        => 'CA',
    ca_country_code => 'US',
  }
~~~

### Installing a Spacewalk Client and Register with the server

~~~
  class {'::spacewalk::client': 
    server_fqdn   => 'spacewalk.company.com',
    activationkey => '1-111222333444555666777888999000aa',
  }
~~~

## Reference

###Defines
* `spacewalk`: Installs spacewalk server.
* `spacewalk::client`: Installs a Spacewalk Client and registers it with the server.

####Define: `spacewalk`

###### These parameters are required

#####`db_pass`

The password used for the database.

#####`ca_cert_passs`

The CA cert password.


###### All the parameters listed below are optional.

#####`package_name`

The name of the spacewalk package.

#####`version`

The version of spacewalk that will be installed.

#####`repo_release`

The spacewalk repo package release number.

#####`db_package_name`

The database package that will be installed.

#####`db_name`

The name of the database spacewalk will use.

#####`db_user`

Database user.

#####`db_pass`

The password used for the database.

#####`db_port`

The port we will connect to the database on.

#####`admin_email`

The admin e-mail for spacewalk and the self signed cert we use for it.

#####`ca_cert_pass`

The CA cert password.

#####`ca_org`

The CA cert organization.

#####`ca_org_unit`

The CA cert organization unit.

#####`ca_city`

The CA cert city.

#####`ca_state`

The CA cert state.

#####`ca_country_code`

The CA cert country.

#####`utils_package_name`

Utility package names.

####Define: `spacewalk::client`

###### These parameters are required

#####`server_fqdn`

The FQDN of the spacewalk server the client will register with.

#####`activationkey`

The spacewalk activationkey that will be used to register
with the server.


###### All the parameters listed below are optional.

#####`client_package_name`

The name of the spacewalk-client package.

#####`version`

The version of spacewalk that will be installed.

#####`release`

The spacewalk-client package release number.

#####`repo_release`

The spacewalk repo package release number.

## Limitations

This module has been tested on CentOS6 with Spacewalk 2.3

## Development

For notes on contributing please follow Puppetlabs [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

## Release Notes/Contributors/Etc **Optional**

### 0.1.0
* Initial Commit
