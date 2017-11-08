node[:keepalived][:pkg].each do |pkg|
  package pkg
end
