# include_recipe '../cookbooks/hosts'

include_recipe '../cookbooks/keepalived/default.rb'
include_recipe '../cookbooks/keepalived/conf.rb'

service 'keepalived.service' do
  action %i[enable restart]
end
