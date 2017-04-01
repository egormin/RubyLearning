#!/usr/bin/env ruby

# Итераторы - это методы которые принимают блок, используются вместо циклов, потому что они более компактны и функциональны.

puts "##### ITERATORS (EACH) #####"

[1,2,3,4,5,6,7,8,9,10].each {|value| print "#{value} "}  # 1 2 3 4 5 6 7 8 9 10
(1..10).each{|e| print e, ', '} # 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,

arr = [1,2,3,4,5,6,7,8,9,10]
#arr.each {|e| do {puts e } end}

puts "##### ITERATORS (TIMES) #####"

10.times {|i| print "#{i} "}  # 0 1 2 3 4 5 6 7 8 9


puts "##### UPTO / STEP #####"

5.upto(10) {|i| print "#{i} "}  # 5 6 7 8 9 10

1.step(10, 2) { |i| print "#{i} "}  # 1 3 5 7 9
1.step(by: 2, to: 15){|x| print x,", "} # 1, 3, 5, 7, 9, 11, 13, 15,
('a'..'z').step(2){|ch| print ch, ", "} # a, c, e, g, i, k, m, o, q, s, u, w, y,


puts "##### MAP / COLLECT #####"

# collect i map - eto sinonimy

a = [1,2,3,4,5]
p a.collect{|e| e**2}           # [1, 4, 9, 16, 25]
p a                             # [1, 2, 3, 4, 5]

p a.collect!{|e| e**2}          # [1, 4, 9, 16, 25]
p a                             # [1, 4, 9, 16, 25]

p a.map{|e| e**2}               # [1, 16, 81, 256, 625]
p a                             # [1, 4, 9, 16, 25]

# Each rabotaet po drugomu:
a = [1,2,3,4,5]
p a.each{|e| e**2}              # [1, 2, 3, 4, 5]
p a                             # [1, 2, 3, 4, 5]


puts "##### COUNT #####"

b = {a: 100, b: 200, c: 300, d: 400}
p b.count{|k, v| v > 250}                 # 2

a = [1,2,3,4,5]
p a.count{|v| v % 2 ==0}                    # 2

p (1..5).count{|v| v**2 >= 16}              # 2


puts "##### ANY? #####"
# Proverka sootvetstviya hotya bi odnogo elementa usloviyu
a = [1, 2, 3, 4, 5]
p a.any?{|e| e > 3}           # true


puts "##### ALL? #####"
# Proverka sootvetstviya vseh elementov usloviyu
a = [1, 2, 3, 4, 5]
p a.all?{|e| e > 3}           # false


puts "##### DETECT #####"
# Find to zhe samoe, chto i detect
# Nahodit pervyi element, kotoryi udovletvoryaet usloviyu

a = [1, 2, 3, 4, 5]
p a.detect{|e| e > 3}           # 4


puts "##### SELECT #####"
# Find_all to zhe samoe, chto i select
# Nahodit vse elementy, kotorie udovletvoryaet usloviyu

a = [1, 2, 3, 4, 5]
p a.select{|e| e > 3}           # [4, 5]
