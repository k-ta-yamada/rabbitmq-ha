# package 'epel-release'
execute "wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -P /usr/src/ -nc"
execute "rpm -ivh /usr/src/epel-release-latest-7.noarch.rpm" do
  not_if "yum list installed | grep epel-release"
end

node[:rabbitmq][:pkg].each do |pkg|
  package pkg
end
