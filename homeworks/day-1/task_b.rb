#!/usr/bin/env ruby

kurs = 11170 + 11170*0.3
puts "To buy 270$ we need summ = #{(kurs*270).to_i} rubbles"


puts "We can buy #{5600000 / kurs.to_i} dollars if we have 5600000 rubbles"

res = 5600000 % kurs.to_i > 10000 ? "can" : "can not"
puts "We #{res} buy an ice cream"


