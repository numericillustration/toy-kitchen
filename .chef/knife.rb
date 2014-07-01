# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "mikeborkborkbork"
client_key               "#{current_dir}/mikeborkborkbork.pem"
validation_client_name   "mike_bork-validator"
validation_key           "#{current_dir}/mike_bork-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/mike_bork"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:vault_mode] = 'client'
