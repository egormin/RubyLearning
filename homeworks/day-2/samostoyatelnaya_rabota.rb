#!/usr/bin/env ruby

number = 13

case number
  when 10 then puts "number = 10"
  when 20, 13
    puts "number = 20 ili " + number.to_s
  else
    puts "ne izvestno"
end

# number = 20 ili 13


# V Ruby est' problema s okrugleniem:
a = 0.1
b = 0.2
p c = a + b   # 0.30000000000000004

# Poetomy nado delat' tak:
 require 'bigdecimal'
p (BigDecimal(a.to_s) + BigDecimal(b.to_s)).to_f   # 0.3
# ILI
p (Rational(1,10) + Rational(2,10)).to_f           # 0.3


