node[:rabbitmq][:pkg].each do |pkg|
  package pkg
end
