#
# Cookbook Name:: hello.js
# Recipe:: default
#
# Copyright 2014, borktastic
#
# All rights reserved - Do Not Redistribute
#
#

application "hello.js" do
  path "/var/www/node-apps/hello.js"
  owner "vagrant"
  group "vagrant"
  repository "https://github.com/numericillustration/hellojs.git"
  nodejs do
    entry_point "app.js"
  end
end
