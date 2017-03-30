#!/usr/bin/env ruby
=begin
Дано целое число. Найти и вывести сумму его цифр.
=end

chislo = 123456
array_from_chislo = chislo.to_i.to_s.split(//)

result = 0
array_from_chislo.each do |e|
  result += array_from_chislo[e.to_i-1].to_i
end

p result
