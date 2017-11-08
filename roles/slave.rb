include_recipe '../cookbooks/hosts'

include_recipe '../cookbooks/rabbitmq/default.rb'
include_recipe '../cookbooks/rabbitmq/plugins.rb'
include_recipe '../cookbooks/rabbitmq/erlang.cookie.rb'
include_recipe '../cookbooks/rabbitmq/join_cluster.rb'

service 'rabbitmq-server.service' do
  action %i[enable restart]
end
