#!/usr/bin/env ruby

puts "##### FUNCTIONS #####"

########## Example 1
def sum (a, b)
  puts "#{a} + #{b} = #{a + b}"
end

sum(5, 10)                         # 5 + 10 = 15


########## Example 2
def sum1 a, b
  return a + b
end

puts "5 + 10 = #{sum1(5, 10)}"     # 5 + 10 = 15


########## Example 3
def array_meth (a)
  a =[1, 2, 3, 4, 5]
end

p array_meth(5)                      # [1, 2, 3, 4, 5]  Method always returns the result of the last command


########## Example 3
def arr1
  a = [1, 2, 3]
  b = 5
  c = "ewrw"
  return [a, b, c]                     # [[1, 2, 3], 5, "ewrw"]
  #return [*a, b, c]                   # [1, 2, 3, 5, "ewrw"]
end

p arr1


########## Example 4
# Ispol'zovanie neobyazatelnykh argumentov
def predopredelennye (a = 10, b = 20, c = 30)
  p "a = #{a}, b = #{b}, c = #{c}"
end

predopredelennye(99)               # "a = 99, b = 20, c = 30" B i C podstavlyayutsya po umolchaniyu eli ih ne peredavat



########## Example 5
# Ispol'zovanie neobyazatelnykh argumentov
def predopredelennye1 (a, b = "xx")
  p "a = #{a}, b = #{b}"
end

predopredelennye1(99)
# ""a = 99, b = xx" a - obyazatelnyi, b - net. Vsegda snachala stavyat obyazatelnye

########## Example 6
# Ispol'zovanie neopredelennogo chila argumentov
def proizvolnoe_kolichetvo (a, b, *free)
  p "a = #{a}, b = #{b}, otalnoe = #{free}"    # "a = 1, b = 4, otalnoe = [5, 7, \"rtw\", 7]"
end

proizvolnoe_kolichetvo(1, 4, 5, 7, 'rtw', 7)


########## Example 7
# Ispol'zovanie neopredelennogo chila argumentov
def operations_with_collection (m, *coll)
  result = []
  result << m
  coll.each{|str| result << str}
  return result
end

collection = %w{hello readers}    # ["hello", "readers"]
p collection

p res = operations_with_collection("XXX", *collection)   # ["XXX", "hello", "readers"]


########## Example 8
# Ispol'zovanie neopredelennogo chila argumentov
def operations_with_collection (m, *coll)
  p "command: #{m}"
  result = []
  coll.each{|str| result << str.send(m)}   # preobrazuet peremennuyu v komandu
  return result
end

collection = %w{hello readers}            # ["hello", "readers"]
p collection

p res = operations_with_collection(:upcase, *collection)  # ["HELLO", "READERS"]


########## Example 9
# Peredacha masiva v funkciyu
def send_array (a, arr)
  p "a = #{a}, array = #{arr}, class massiva = #{arr.class}, size = #{arr.size}"
  p sum = arr.inject{|sum, num| sum += num}    # 15
end
mas = [1,2,3,4,5]

send_array(5, mas)               # "a = 5, array = [1, 2, 3, 4, 5], class massiva = Array, size = 5"


########## Example 10
# Peredacha masiva v funkciyu  (ne ponyatno v chem raznitsa)
def send_array1 (a, *arr)
  p "a = #{a}, array = #{arr}, class massiva = #{arr.class}, size = #{arr.size}"
  p sum = arr.inject{|sum, num| sum += num}    # 15
end
mas = [1,2,3,4,5]

send_array1(5, *mas)                   # "a = 5, array = [1, 2, 3, 4, 5], class massiva = Array, size = 5"


########## Example 11   Vot vidna raznita
# Peredacha masiva v funkciyu
def arr2 (a, b="x", *c)
  p "a = #{a}, b = #{b}, c = #{c}"
end

arr2(1, *[9, 8, 7])            # "a = 1, b = 9, c = [8, 7]"


# Peredacha masiva v funkciyu
def arr3 (a, b="x", c)
  p "a = #{a}, b = #{b}, c = #{c}"
end

arr3(1, [9, 8, 7])            # "a = 1, b = x, c = [9, 8, 7]"



########## Example 11
# Sozdanie metodov na letu

class Experiment
end

a = Experiment.new

a.define_singleton_method(:bye) do |name|
  puts "hello, #{name}"
end

a.bye("egor")              # hello, Egor
# Iznachal\no u nas byl class, kotoryi nichego ne delal, i my sozdaym v nem metod bye v procese vypolneniya ptogrammy

a.define_singleton_method(:oper) do |name, operation|
  puts "hello, #{name.send(operation)}"
end

a.oper("egor", "capitalize")           # hello, Egor



########## Example 11
# Method missing
class Test
  def method_missing(name, arg, &block)
    if name =~ /count_to/
      (arg+1).times {|e| print e}
    end
  end

  def my_meth m
    p "All ok, m = #{m}"
  end
end

a = Test.new

a.my_meth(10)        # "All ok, m = 10"   Etot method syschestvuet
a.count_to(5)           # 012345             Etot net, no on popadaet pod method_missing
a.xxx(5)                #                    Etot net, i on prosto ne otrabotaet


########## Example 12
# Imenovannye parametry

def imenovannye (str: "stringa", num: 99)
  p "str = #{str}, num = #{num}"
end

imenovannye(str: "one", num: 1)               # str = one, num = 1"












