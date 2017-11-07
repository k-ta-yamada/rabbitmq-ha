# RabbitMQ HA

RabbitMQ High availability configuration by haproxy and Keepalived.

> NOTE: This repository is for self-study.



## Usage

### Server setup

```sh
# vagrant up
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-proxyconf # if you needed
vagrant up
vagrant reload # to reflect SELINUX setting change, reload.
```

### Using `itamae`

```sh
# install itamae
# NOTE: in the following command example omit "bundle exec"
bundle install --path vendor/bundle

# Primary node `pg1`: PostgreSQL and pgpool-II
itamae ssh -h pg1 -y node/develop.yml roles/db_master.rb
itamae ssh -h pg1 -y node/develop.yml roles/pool1.rb

# Standby node `pg2`: PostgreSQL and pgpool-II
itamae ssh -h pg2 -y node/develop.yml roles/db_slave.rb
itamae ssh -h pg2 -y node/develop.yml roles/pool2.rb
```
