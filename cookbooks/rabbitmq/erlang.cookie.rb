PATH    = node[:rabbitmq][:".erlang.cookie"][:path]
CONTENT = node[:rabbitmq][:".erlang.cookie"][:content]

file "#{PATH}.erlang.cookie" do
  content CONTENT
  owner "rabbitmq"
  group "rabbitmq"
  mode  "400"
end
