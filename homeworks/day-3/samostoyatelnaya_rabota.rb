#!/usr/bin/env ruby

puts "########## EACH ##########"

# Example 1
a = [1,2,3,4,5]
h = {}
p a.each{|value| h[value]= value**2}  # [1, 2, 3, 4, 5]
p h                                   # {1=>1, 2=>4, 3=>9, 4=>16, 5=>25}

# Example 2
(1..5).each{|e| print e**2, " "}   # 1 4 9 16 25


# Example 3
h = {a: 100, b:200, c:300, d:400}
h.each{|val| print val, " "}    # [:a, 100] [:b, 200] [:c, 300] [:d, 400]
h.each{|key, val| print key, "=>", val, " "}    # a=>100 b=>200 c=>300 d=>400


puts "########## each_with_index ##########"
a = [10,20,30,40]
p a.each_with_index{|value, key| a[key] = value ** 2}    # [100, 400, 900, 1600]

(1..5).each_with_index{|value, position| print "value = #{value}, key = #{position}" , ", "}
# value = 1, key = 0, value = 2, key = 1, value = 3, key = 2, value = 4, key = 3, value = 5, key = 4,

# pri hashe proishodit preobrazovanie v massiv
h = {a: 100, b: 200, c: 300, d: 400}
h.each_with_index{|v, k| print "#{k} > #{v} "}   # 0 >[:a, 100] 1 >[:b, 200] 2 >[:c, 300] 3 >[:d, 400]

puts "########## each_with_index ##########"
a = [1,2,3,4,5]
a2 = a.map{|e| e**2}
p a2                    # [1, 4, 9, 16, 25]

puts "########## count ##########"

hh = {:a=>100, :b=>200, :c=>300, :d=>400}
p hh.count{|k, v| v > 250}                 # 2

a = [1,2,3,4,5]
p a.count{|v| v % 2 ==0}                    # 2

p (1..5).count{|v| v**2 >= 16}              # 2


puts "########## any / all ##########"
a = [1,2,3,4,5]
p a.any?{|v| v % 2 == 0}                    # true
p a.all?{|v| v % 2 == 0}                    # false

puts "########## find / detect ##########"
# Find to zhe samoe, chto i detect
# Nahodit pervyi element, kotoryi udovletvoryaet usloviyu
a = [1,2,3,4,5]
p a.detect{|v| v >2}                        # 3
p a.find{|v| v >2}                          # 3

puts "########## find_all / select ##########"
# Find_all to zhe samoe, chto i select
# Nahodit vse elementy, kotorie udovletvoryaet usloviyu
a = [1,2,3,4,5]
p a.select{|v| v > 3}                       # [4, 5]
p a.find_all{|v| v > 3}                     # [4, 5]




puts "########## METHODS ##########"
value = Proc.new do
  puts "Hello, Rubby"
end
value.call                         #Hello, Rubby

value1 = Proc.new do |param|
  puts "Hello, #{param}"
end
value1.call('Jack')        # Hello, Jack



def double
  yield
  yield
end
double{ puts "Hi"}
# Hi
# Hi


def double1(block)
  p block.class
  block.call
  block.call
end
double1 lambda {puts "Hi"}
# Proc
# Hi
# Hi












