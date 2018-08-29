#
# Cookbook:: national-parks
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

hab_install

hab_sup 'dev' do
  peer node['habitat_peer']
end

hab_package 'th_demo/national-parks' do
  channel 'stable'
end

hab_service 'th_demo/national-parks' do
  service_name 'th_demo/national-parks'
  peer node['habitat_peer']
  topology 'standalone'
  service_group 'dev'
  strategy 'at-once'
  channel 'stable'
  bind ['database:np-mongodb.dev']
  action :load
end
