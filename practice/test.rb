#!/usr/bin/env ruby
=begin
Дано целое число. Найти и вывести сумму его цифр.
=end



def my_meth(a:1, b:2, **other)
  block_given?? (other.each{|e| yield(e)}) : (p "ERROR")
end

#my_meth(a: 1,b: 2,3,4,5,6)                    # "ERROR"
#my_meth(a: 1,b: 2,3,4,5,6){|i| puts i}



def imenovannye (str, num, *oth)
  p "str = #{str}, num = #{num}, other: #{oth}"
end

#imenovannye(num: "num", str: "str", add:"d")

def m(*other, foo:, bar:)
  p "foo = #{foo}, bar = #{bar}, other = #{other}"
end

m(5, 7, bar: "b", foo: "f" ) # => [3, 3]
