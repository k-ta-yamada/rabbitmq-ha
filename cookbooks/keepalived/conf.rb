KEEPALIVED_CONF = node[:keepalived][:keepalived_conf]
GLOBAL_DEFS     = KEEPALIVED_CONF[:global_defs]
VRRP_SCRIPT     = KEEPALIVED_CONF[:vrrp_script]
VRRP_INSTANCE   = KEEPALIVED_CONF[:vrrp_instance]

# UNICAST_PEER = node[:hosts][:frontend].map { |h| h["ip"] }
UNICAST_PEER = node[:hosts][:backend].map { |h| h["ip"] }

template "/etc/keepalived/keepalived.conf" do
  variables global_defs:   GLOBAL_DEFS,
            vrrp_script:   VRRP_SCRIPT,
            vrrp_instance: VRRP_INSTANCE,
            unicast_peer:  UNICAST_PEER
  only_if "test -d /etc/keepalived"
end
