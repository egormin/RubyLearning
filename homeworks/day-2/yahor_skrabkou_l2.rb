#!/usr/bin/env ruby




if ARGV.size > 1
  puts "Only 1 argument needed"
  exit
end


if ARGV[0]

  result  = [1, 1]
  i = 0
  while result.size <= ARGV[0].to_i
    if i == 0 || i == 1
      i+=1
      next
    end
    result << result[i-2] + result[i-1]

    i+=1
  end
  p result

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





