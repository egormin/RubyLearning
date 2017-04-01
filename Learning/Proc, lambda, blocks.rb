#!/usr/bin/env ruby


# proc and lambda are BLOCKS
puts "########## PROC ##########"


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

########## Example 5 (to_proc)
cap = :capitalize.to_proc
p cap.call("man")       # "Man"

# Eto to zhe samoe, chto i:
aaa = Proc.new{|arg| arg.send(:capitalize)}
p aaa.call("man")             # "Man"


puts "########## LAMBDA ##########"
# Lambda pochtoo to zhe samoe, chto i proc, no est' paru otlichiy:

########## Lyambda priveredliva i rugaetsy, esli ey peredat' menshe znacheniy, chem ona ozhidaet

aaa = lambda{|a,b| p a,b}

#aaa.call("a")      # ERROR  wrong number of arguments (given 1, expected 2) (ArgumentError)




########## Lyambda vozvrascaet ruzultat vsey raboty, a ne vyhodit pri pervom return
def max_element1
  p = lambda{ return [1,2,3,4] }   # Tut on vyshel
  array =p.call
  return array.max
end
p max_element1         # 4



puts "########## BLOCKS ##########"

def double
  yield
  yield
end
# Hi
# Hi

double{ puts "Hi"}

def meth_with_block(hello)
  p hello
  yield(hello)
end

p meth_with_block("eg"){|msg| puts msg}
#"eg"
#eg
#nil

# to zhe samoye
def meth_with_block(hello, &block)
  p hello
  block.call("eg")
end
p meth_with_block("eg"){|msg| puts msg}
#"eg"
#eg
#nil

def meth5(&block)
  p block_given?
end
meth5            # false


def meth6(var, &block)
  p block_given?                        # true
  block.call(var) if block_given?
end
meth6("hello"){|val|p val}          # hello
# true
# "hello"

# Esli imya peremennoy v bloke i vneshney peremennoy sovpadaet, to mozhno peredat ei znachenie v yield
def with_one
  yield(1)
end

number = 99
with_one { |number| puts "number равно #{number}" }
# number равно 1










