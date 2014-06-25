#!/usr/bin/env ruby
require 'json'
require 'getoptlong'

opts = GetoptLong.new(
  [ '--verbose', '-v', GetoptLong::NO_ARGUMENT ],
)
verbose = nil

opts.each do |opt, arg|
  case opt
    when '--verbose'
      verbose = true
  end
end

# assumes knife is in your path and that you are already setup to talk to your chef server.
my_cooks = JSON.load( %x(knife cookbook list -F json))


my_cooks_hash = Hash.new

my_cooks.each do |line|
  foo = line.split
  local_meta_file_name = "./cookbooks/#{foo[0]}/metadata.rb"
  #local_version = "#{cook_rb_file[1]}".gsub(/['"]/, '')
  if File.exists?("#{local_meta_file_name}")
    meta_version_line = %x{grep '^version' #{local_meta_file_name}}.split
    local_version = "#{meta_version_line[1]}".gsub(/['"]/, '')
  else
    local_version = "DNE"
  end

  my_cooks_hash[foo[0]] = { 
                            'opscode' => foo[1],
                            'local'   => local_version
                          }

  if "#{my_cooks_hash[foo[0]]['opscode']}" !=  "#{my_cooks_hash[foo[0]]['local']}" 
    puts [ 
            "#{foo[0]} versions haz mismatch.",
            "    Managed chef version is: #{my_cooks_hash[foo[0]]['opscode']}",
            "    Local git version is:    #{my_cooks_hash[foo[0]]['local']}"
         ]
  else
    if verbose
      puts "#{foo[0]} versions match."
    end
  end
end


