#!/usr/bin/env ruby

# 1) Output
# Bez perenosa stroki
print "Hello"
print "World"
print ("Hello")
#HelloWorldHello"Hello"

# S perenosom stroki
p "Hello"  # "Hello"   v kavychkah
p "World"  # "World"

puts "puts-Hello"  # puts-Hello
puts "puts-World"  # puts-World

# Upravlyayuschis simvoly
print "Hel \n lo"
p "Hel \n lo"    # p ne obrabatyvaet upravlyayuschie simvoly
puts "Hel \n lo"

=begin
Hel
lo"Hel \n lo"
Hel
lo
=end

# 2) Operacii so strokami
puts "1" + "2"  # 12
puts "1" * 5    # 11111


aaa = "Hello, "
puts aaa + "World!"  # Hello, World!



