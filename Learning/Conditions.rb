#!/usr/bin/env ruby

# 1) IF

if 2 > 1
  puts "2 > 1"
end
# 2 > 1

unless 2 > 1   # protivopolozhnoe if
  puts "2 > 1"
end
# nichego ne vyvedetsya

aaa = "xxx"
if aaa == "xxx"
  puts "xxx"
end

if 5 > 10
  puts "5 > 10"
else
  puts "5 < 10"
end
# 5 < 10

if 5 == 10
  puts "5 > 10"
elsif
  puts "5 < 10"
else
  puts "5 = 10"
end
# 5 = 10

puts (if 5 > 10 then "yes" else "no" end)  # no
puts (if 1 then 2 else 3 end)              # 2

#ternary
puts 5 > 10 ? "yes" : "no"                 # no
puts 1 ? 2 : 3                             # 2




if 5 < 10 then puts "5 < 10" end  # 5 < 10   Dlya odnostrochnikov

a = 456
puts case a
       when 1..5
         "It's between 1 and 5"
       when 6
         "It's 6"
       when String
         "You passed a string"
       else
         "You gave me #{a} -- I have no idea what to do with that."
     end

# a = "456"    You passed a string
# a = 456    You gave me 456 -- I have no idea what to do with that.

