#!/usr/bin/env ruby

p "1 + 1"      # "1 + 1"
puts 1 + 1     # 2

p "10 / 3"     # "10 / 3"
puts 10 /3     # 3

p "10.0 / 3"   # "10.0 / 3"
puts 10.0 / 3  # 3.33333333333333

p "(10*99999999999999999999999999999999999).class"  # "(10*99999999999999999999999999999999999).class"
puts (10*99999999999999999999999999999999999).class  # Bignum

puts 3.class       # Fixnum
puts 3.2.class     # Float
puts "text".class  # String


p "float to integer: 123.0.to_i"
puts 123.0.class        # Float
puts 123.0.to_i.class   # Fixnum

p "integer to complex: 123.to_c"
puts 123.class         # Fixnum
puts 123.to_c.class    # Complex

p "2 ** 3"             # "2 ** 3"
puts 2 ** 3            # 8

p "2 ** 3"             # "2 ** 3"
puts (2 ** 3).class    # Fixnum

p "2 ** 0.5"           # "2 ** 0.5"
puts 2 ** 0.5          # 1.4142135623731



