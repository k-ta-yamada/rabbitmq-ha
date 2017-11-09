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

# `mq1` and `mq2`: keepalived
itamae ssh -h mq1 -y node/develop.yml roles/keepalived.rb
itamae ssh -h mq2 -y node/develop.yml roles/keepalived.rb
```



## TODO

- [ ] Detailed configurate of `haproxy`
  - ref: [./cookbooks/haproxy/files/etc/haproxy.cfg](./cookbooks/haproxy/files/etc/haproxy.cfg)
  - [x] Change the `frontend` and `backend` pairs to `listen`
    - http://cbonte.github.io/haproxy-dconv/1.5/configuration.html#2.3



## References

### RabbitMQ

- [RabbitMQ - Messaging that just works](https://www.rabbitmq.com/)

### HAProxy

- [HAProxy Documentation Converter](http://cbonte.github.io/haproxy-dconv/)
- [HAProxyを使い始めてみる - Qiita](https://qiita.com/saka1_p/items/3634ba70f9ecd74b0860)

### keepalived

- [./cookbooks/keepalived/files/etc/keepalived/man-8-keepalived](./cookbooks/keepalived/files/etc/keepalived/man-8-keepalived)
- [./cookbooks/keepalived/files/etc/keepalived/man-5-keepalived.conf](./cookbooks/keepalived/files/etc/keepalived/man-5-keepalived.conf)
- [./cookbooks/keepalived/files/usr/share/doc/keepalived-1.3.5/keepalived.conf.SYNOPSIS](./cookbooks/keepalived/files/usr/share/doc/keepalived-1.3.5/keepalived.conf.SYNOPSIS)
- [keepalived | Read the Docs](https://readthedocs.org/projects/keepalived/)
- [keepalived.conf - configuration file for keepalived - Linux Man Pages (5)](https://www.systutorials.com/docs/linux/man/5-keepalived.conf/)
- [17.5.1 Keepalived構成ファイルについて](https://docs.oracle.com/cd/E39368_01/e48214/section_wv3_hjn_pr.html)
