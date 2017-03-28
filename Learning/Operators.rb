#!/usr/bin/env ruby

puts 1 + 2      # 3
puts 7 - 3      # 4
puts 2 * 3      # 6
puts 10 / 2     # 5
puts 10 / 3     # 3  Okrugleno do tselogo, t.k. integer
puts 10.0 / 3   # 3.33333333333333
puts 10 % 3     # 1

puts 2 ** 3     # 8
aaa = 2
puts aaa += 1   #3

puts 5 > 7      # false
puts 5 == 5     # true
puts 5 >= 4     # true
puts 5 <= 4     # false
puts 5 != 4     # true

puts 2 + 3 * 5    # 17
puts (2 + 3) * 5  # 25

puts true && false  # false (and)
puts true || false  # true (or)

puts (1 == 1) && (2 > 3)   # false
puts (1 == 1) && (4 > 3)   # true

puts (1 == 1) || (2 > 3)   # true
puts (1 == 10) || (1 > 3)  # false
puts 1 == 10 || 1 > 3      # false    Mozhno i bez skobok




