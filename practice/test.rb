#!/usr/bin/env ruby
=begin
Дано целое число. Найти и вывести сумму его цифр.
=end


class Array
  def my_calc
    self.select{|e| yield(e) if e.even? == true }
  end
end

puts [1, 2, 3, 4, 5, 6, 7].my_calc{|i| i > 2}.inspect                        # [4, 6]
puts [1, 2, 3, 4, 5, 6, 7].my_calc {|i| i > 10}.inspect                      # []
puts [2, 4, 6, 8, 10, 12, 7].my_calc{|i| i.between?(6, 12)}.inspect          # [6, 8, 10, 12]

[4, 6]
[]
[6, 8, 10, 12]
