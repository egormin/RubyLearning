#!/usr/bin/env ruby


# proc and lambda are BLOCKS
puts "##### PROC #####"


########## Example 1
aaa = Proc.new{|name| p "his name's #{name}"}
aaa.call("vasya")     # "his name's vasya"

# Mozhno ispol'zovat' i tak:
(Proc.new{|name| p "his name's #{name}"}).call"vasya"   # "his name's vasya"


# V dannom sluchae  Prok - eto ANALOG sleduyuscei konstrucii
def aaa1 (name)
  p "his name's #{name}"
end
aaa1("vasya")         #"his name's vasya"


########## Example 2

# Proc vidit peremennye vne ego
hello = "Hello World"
(Proc.new{p hello}).call                          # "Hello World"
(Proc.new{p hello}).call("xxx")           # "Hello World"
(Proc.new{|hello| p hello}).call("xxx")   # xxx"     Tut my peredaem svoe znachenie

# A obychnyi metod ne vidit!!!
def test
 #p hello               # ERROR: in `test': undefined local variable or method `hello'
end
#p test



########## Example 3
p = Proc.new do |a,b,c|
  print "a = #{a}, b = #{b}, c = #{c}, c clas = #{c.class}"
end

p.call("tut", 3)          # a = tut, b = 3, c = , c clas = NilClass   Proc mozhet prinimat' lyuboe kol-vo argumentov.
                          # Esli nuzhnyi argument ne peredan - on budet nil


p = Proc.new { |i, k| p i, k }

p.call("hello", "world")            #  "hello","world"
p.call("hello")                     #  "hello, nil


# Esli peredat bo'she argumentov, chem nuzhno, lishnie prosto otbrosyatsya

p = Proc.new { |i, k| p i, k }
p.call("Proc", "one", "two")         #  "Proc" "one"


########## Example 4 (Osobennosti)

def max_element
  p = Proc.new{ return [1,2,3,4] }   # Tut on vyshel
  array =p.call
  return array.max
end

p max_element                # [1, 2, 3, 4]
# Po idee, nam dolzhni bili vyvesti max element sredi vseh el-tov massiva, no Proc vyhodit iz vypolneniya na pervom zhe return.

# ODNAKO!!!!!

