#!/usr/bin/env ruby

puts "##### RANGES #####"

p (1..10).class   # Range

#(1..5) 1 2 3 4 5

#(1...5) 1 2 3 4   Poslednee chislo ne vklyuchaetsya

#('a'..'z') ves' alfavit

p (1..3).to_a  # [1, 2, 3]  Convertation to array


p (1..3).min    # 1
p (1..3).max    # 3
p (1..5).first  # 1
p (1..5).last   # 5

p (100..1).first  # 100
p (100..1).last   # 1

p (100..1).min   # nil   Pri obratnom diapazone min i max dayut nil. Eto udobno dlya opredeleniya, yavlyaetsya li
p (100..1).max   # nil   posledovatel\nost obratnoi


p (1..100000).include?(1)       # true  Proverka na vklyuchenie v diapazon
p (1..100000).include?(100001)  # false
# to zhe samoe i member
p (1..100000).member?(100001)   # false
p ('a'..'y').member?("c")       # true
p ('a'..'y').member?("z")       # false


puts "### Primenenie ###"

a = 101
case a
       when 1..5 then puts "0 < a < 50"
       when 50...100 then puts "50 <= a < 100"
       when 100...150 then puts "100  100 <= a < 150"
end

# 100 <= a < 150



