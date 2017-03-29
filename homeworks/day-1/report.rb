#!/usr/bin/env ruby

=begin

###################

##### установить системный Ruby через yum
yum install ruby
yum install ruby-devel rubygems

##### установить новые библиотеки-гемы ‘pry’, ‘sqlite3’
gem install pry
yum install sqlite-devel
gem install sqlite3

gem list

##### удалить гемы
gem uninstall pry
gem uninstall sqlite3

##### удалить системный Ruby
yum remove ruby



###################

### установить Ruby 2.2.1 / 2.2.0 через RVM.

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
bash --login
rvm requirements
rvm -v


rvm install ruby-2.4.1
rvm install ruby-2.2.1
rvm use 2.4.1 --default
rvm list

### создать новый gemset mtn, сделать его дефолтным при заходе в баш
rvm gemset create mtn
rvm gemset use mtn --default

###установить в нем библиотекигемы ‘pry’, ‘sqlite3’
gem install pry
gem install sqlite3
gem list
#####################
=end

############### task_a ###############

vedro_red = 50
vedro_green = 100
vedro_blue = 30
vedro_yellow = 60

values_array = [50, 100, 30, 60]
maxval = values_array.max

case maxval
  when 50
    color = "red"
  when 100
    color ="green"
  when 30
    color ="blue"
  else
    color ="yellow"
end


puts "The maximum numbers of balls has a bucket with " +  color + " color"


if vedro_green > vedro_yellow
  puts "The green bucket contains more balls"
else
  puts "The yellow bucket contains more balls"
end

if vedro_green > vedro_red + vedro_blue
  puts "The green bucket contains more balls"
else
  puts "The red and yellow buckets contain more balls than green"
end


############### task_b ###############

kurs = 11170 + 11170*0.3
puts "To buy 270$ we need summ = #{(kurs*270).to_i} rubbles"


puts "We can buy #{5600000 / kurs.to_i} dollars if we have 5600000 rubbles"

res = 5600000 % kurs.to_i > 10000 ? "can" : "can not"
puts "We #{res} buy an ice cream"

