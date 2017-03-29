#!/usr/bin/env ruby



def fib(n)
  return 1 if n <= 2

  fib_index = 3
  a, b = 1, 1

  while fib_index <= n
    c = a + b
    a = b
    b = c
    fib_index += 1
  end
  c
end


if ARGV.size > 1
  puts "Only 1 argument needed"
  exit
end


if ARGV[0]
  p (1..ARGV[0].to_i).map {|i| fib(i)}
else
  puts "Mandatory argument missed"
end




#phrase = "dniMyMdegnahCybuR"
phrase = "dlroWolleH"

puts phrase.reverse.downcase.capitalize

phrase = "124421"
if phrase == phrase.reverse
  puts "This is a polindrom"
else
  puts "This is not polindrom"
end



aaa = 1234567
puts aaa.to_s.reverse

bbb = 12345
xxx = bbb.to_s.split(//)
puts xxx[1]

res = 0
i=0
while i <= xxx.size
 res += xxx[i].to_i
  i+=1
end

puts res





