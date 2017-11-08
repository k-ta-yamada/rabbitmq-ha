# include_recipe '../cookbooks/hosts'

include_recipe '../cookbooks/haproxy/default.rb'
include_recipe '../cookbooks/haproxy/conf.rb'

service 'haproxy.service' do
  action %i[enable restart]
end
