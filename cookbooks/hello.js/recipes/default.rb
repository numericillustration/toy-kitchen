#
# Cookbook Name:: hello.js
# Recipe:: default
#
# Copyright 2014, borktastic
#
# All rights reserved - Do Not Redistribute
#
#

ruby include_recipe "nodejs"
ruby include_recipe "passenger_apache2"

node['passenger']['install_method'] = 'package'
node['passenger']['package']['name'] = 'libapache2-mod-passenger'



application "hello.js" do
  path "/var/www/node-apps/hello.js"
  owner "vagrant"
  group "vagrant"
  repository "https://github.com/numericillustration/hellojs.git"
  nodejs do
    entry_point "app.js"
  end
end
