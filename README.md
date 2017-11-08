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

# Primary node `mq1`: RabbitMQ
itamae ssh -h mq1 -y node/develop.yml roles/rabbit_master.rb

# Standby node `mq2`: RabbitMQ
itamae ssh -h mq2 -y node/develop.yml roles/rabbit_slave.rb

# `mq1` and `mq2`: haproxy
itamae ssh -h mq1 -y node/develop.yml roles/haproxy.rb
itamae ssh -h mq2 -y node/develop.yml roles/haproxy.rb
```



## TODO

- [ ] Detailed configurate of `haproxy`
  - ref: [./cookbooks/haproxy/files/etc/haproxy.cfg](./cookbooks/haproxy/files/etc/haproxy.cfg)
  - [x] Change the `frontend` and `backend` pairs to `listen`
    - http://cbonte.github.io/haproxy-dconv/1.5/configuration.html#2.3



## References

### RabbitMQ

[RabbitMQ - Messaging that just works](https://www.rabbitmq.com/)

### HAProxy

[HAProxy Documentation Converter](http://cbonte.github.io/haproxy-dconv/)
