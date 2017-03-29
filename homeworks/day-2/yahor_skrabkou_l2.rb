#!/usr/bin/env ruby

input_array = ARGV

if input_array.size > 1
  puts "Only 1 argument needed"
  exit
end


fibs = []
i = 0

while i <= input_array[0].to_i
  fibs << i
  i += 1
end

puts fibs

#or i in range(n - 2):
#  fibs.append(fibs[i] + fibs[i + 1])  # [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
#  print(fibs)