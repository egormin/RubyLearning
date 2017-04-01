#!/usr/bin/env ruby
=begin
Дано целое число. Найти и вывести сумму его цифр.
=end
p (1..1000).detect{|val| (val % 7 == 3) && (val.to_s.size == 3)}




