#!/usr/bin/env ruby
=begin
Дано целое число. Найти и вывести сумму его цифр.
=end

require 'yaml'

config = YAML.load(File.open("cli.yaml"))
p config


x = config["output_log"]

p x