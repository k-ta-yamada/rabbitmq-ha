PLUGINS = node[:rabbitmq][:plugins]

PLUGINS.each do |plugin|
  execute "rabbitmq-plugins enable #{plugin}"
end
