#!/usr/bin/env ruby
=begin
Дано целое число. Найти и вывести сумму его цифр.
=end



class Test
  def write
    puts "write meth"
  end
  def read
    puts "read meth"
  end
end



cmd = "Test"
p cmd


  instance = (Object.const_get(cmd)).new
  p instance.write





# instance = (Object.const_get(cmd)).new
#
# p "class name of cmd #{p cmd.class.name}"
# p instance.name



