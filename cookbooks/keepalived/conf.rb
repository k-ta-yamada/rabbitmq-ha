KEEPALIVED_CONF = node[:keepalived][:keepalived_conf]
GLOBAL_DEFS     = KEEPALIVED_CONF[:global_defs]
VRRP_SCRIPT     = KEEPALIVED_CONF[:vrrp_script]
VRRP_INSTANCE   = KEEPALIVED_CONF[:vrrp_instance]

HOSTS_ENTRIES = node[:hosts][:frontend]
# HOSTS_ENTRIES = node[:hosts][:backend]

template "/etc/keepalived/keepalived.conf" do
  hostname = run_command("hostname").stdout.chomp
  unicast_src_ip = HOSTS_ENTRIES.select { |h| h["host"] == hostname }.first["ip"]
  unicast_peer   = HOSTS_ENTRIES.reject { |h| h["host"] == hostname }.map { |h| h["ip"] }
  puts "hostname       = [#{hostname}]"
  puts "unicast_src_ip = [#{unicast_src_ip}]"
  puts "unicast_peer   = [#{unicast_peer}]"
  variables global_defs:    GLOBAL_DEFS,
            vrrp_script:    VRRP_SCRIPT,
            vrrp_instance:  VRRP_INSTANCE,
            unicast_src_ip: unicast_src_ip,
            unicast_peer:   unicast_peer
  only_if "test -d /etc/keepalived"
end
