#!/usr/bin/env ruby

class Config_data
  def self.yaml_config
    require 'yaml'
    YAML.load(File.open('cli.yaml'))
  end
end

#name ='help'
#xx = Config_data.yaml_config['commands'].each {|v, k| v if v[name] == name }
#p xx


com = 'help'

aaa = {'aa' =>"effsasf"}
#p aaa['aa']

yyy = [{"help"=>"Print help information"}, {"uptime"=>"Tell how long the system has been running"}, {"echo"=>"Display a line of text"}, {"ping"=>"Send ICMP ECHO_REQUEST to network hosts"}, {"exit"=>"Exit from script"}]
#p yyy[0]["help"]


#yyy.each{ |key|  p yyy[key]['command']}
xxx = yyy.detect{ |key| key.keys[0] == com}.keys[0]


p xxx

aaa = {"help"=>"Print help information", "uptime"=>"Tell how long the system has been running", "echo"=>"Display a line of text", "ping"=>"Send ICMP ECHO_REQUEST to network hosts", "exit"=>"Exit from script"}

nnn = aaa.keys.find{|v| v == 'help'}
p aaa[nnn]

