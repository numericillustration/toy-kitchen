#
# Cookbook Name:: hello.js
# Recipe:: default
#
# Copyright 2014, borktastic
#
# All rights reserved - Do Not Redistribute
#
#

application "hello-demo" do
  path "/var/www/node-apps/hello-demo"
  owner "vagrant"
  group "vagrant"
  repository "https://github.com/numericillustration/hellojs.git"
  passenger_apache2
end
