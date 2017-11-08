HOSTNAME_PRIMARY = node[:common][:hostnames][:primary]

service 'rabbitmq-server.service' do
  action %i[restart]
end

execute "rabbitmqctl stop_app"

execute "rabbitmqctl join_cluster rabbit@#{HOSTNAME_PRIMARY}"

execute "rabbitmqctl start_app"

execute %q(rabbitmqctl set_policy all '^.*' '{ "ha-mode": "all", "ha-sync-mode": "automatic" }')
