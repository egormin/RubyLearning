#!/usr/bin/env ruby

require 'yaml'

config = YAML.load_file("config.yaml")
p config
p config["email_list"]

# {"node"=>"10.0.0.15", "user"=>"admin", "password"=>"admin", "email_list"=>["one", "two", "three"], "email"=>"admin@email.com"}
# ["one", "two", "three"]


hash = {mtn: :cool, lab: %w(1,2,3,4)}
File.open('config2.yaml', 'w') {|f| f.write(hash.to_yaml)}
config1 = YAML.load_file("config2.yaml")
p config1
# {:mtn=>:cool, :lab=>["1,2,3,4"]}