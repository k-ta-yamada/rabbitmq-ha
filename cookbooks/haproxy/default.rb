node[:haproxy][:pkg].each do |pkg|
  package pkg
end
