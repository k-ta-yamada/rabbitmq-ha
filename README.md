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

# Primary node `mq1`
itamae ssh -h mq1 -y node/develop.yml roles/rabbit_master.rb

# Standby node `mq2`
itamae ssh -h mq2 -y node/develop.yml roles/rabbit_slave.rb
```
