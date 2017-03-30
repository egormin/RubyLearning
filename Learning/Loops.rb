#!/usr/bin/env ruby

# 1) Loop
puts "##### LOOP (break) #####"

# loop {puts "Hello Word!"}  Beskonechnyi tsikl

i = 0
loop do
  i+=1
  print "#{i}"    # 12345678910
  break if i==10
end

puts "\n##### LOOP (next) #####"

i = 0
loop do
  i+=1
  next if i==5
  print "#{i}"    # 1234678910
  break if i==10
end

i=0
puts(
    loop do
      i+=1
      print "#{i} "
      break 'Hello' if i==10   # 1 2 3 4 5 6 7 8 9 10 Hello
    end)




puts "\n##### WHILE #####"

i = 0
while i <= 10
  print i  # 012345678910
  i += 1
end

puts "\n##### UNTIL #####"

i = 0
until i > 10
  print i   # 012345678910
  i+=1
end

puts "\n##### UNTIL (redo) #####"
i = 0
until i > 10
  print i   # 012345678910
  i+=1
  #redo if i = 5  # redo nachnet tsikl snachala, esli ego raskommentit' to budet beskonechnyi tsikl
end

puts "\n##### (while and until as modifiers) #####"
i=0
print "#{i+=1} " while i < 10 # 1 2 3 4 5 6 7 8 9 10
#Вот еще пример:
i=0
print "#{i+=1} " until i == 10 # 1 2 3 4 5 6 7 8 9 10

puts "\n##### begin / end #####"
i=11
begin
  print "#{i} "  # 11
  i+=1
end while i < 10

i=10
begin
  print "#{i} " # 10
  i+=1
end until i == 11

puts "##### FOR #####  (ne zhelatelno ispolzovat)"
for i in 1..10
  print "#{i} "   # 1 2 3 4 5 6 7 8 9 10
end
#или по значениям в массиве:
for value in [1,2,3,4,5,6,7,8,9,10]   # 1 2 3 4 5 6 7 8 9 10
  print "#{value} "
end


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










