#!/usr/bin/env ruby

# 1) ARRAYS
puts "##### ARRAYS Creating #####"

array = ["Welcome", "love", "to", "world"]
puts array
#Welcome
#love
#to
#world
p array
# ["Welcome", "love", "to", "world"]

array1 = %w{hello (0..10) 6 7 world}
p array1 #["hello", "(0..10)", "6", "7", "world"]   Can contains different types of data

array2 = %w{hello (0..10) 6 7 world}
p array2  # ["hello", "(0..10)", "6", "7", "world"]   Mozhno i tak obyavliat'


a = []
a[0] = 1
a[5] = 6
p a   # [1, nil, nil, nil, nil, 6]

a = %w{Welcome love  [1,2,3]}
p a  # ["Welcome", "love", "[1,2,3]"]


a = Array.new(10){|elem| elem.odd? ? elem**2 : elem**3}
p a  # [0, 1, 8, 9, 64, 25, 216, 49, 512, 81]

a = Array.new(10){|e| e}
p a   # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

puts "##### ARRAYS Obraschenie #####"

a = [1, 2, 3]
p a[2]  # 3
p a[3]  # nil

p a[1..a.size] # [2, 3]   Vyvodit znacheniya ydchinaya s 1 elementa massiva

ary = [0, 4, 7, 10, 12]
x = ary.bsearch {|x| x > 4 }
p x  #  Vyvodit pervoe znachenie, kotoroe > 4

p ary.first  # 0
p ary.last   # 12

arr = %w{1 5 hello}
p arr       # ["1", "5", "hello"]
p arr.pop   # "hello"
p arr       # ["1", "5"]

p [1,5,6,7,10].take(3)  # [1, 5, 6]   Pokazyvaet 3 pervyh elementa


puts "##### ARRAYS Dobavlenie elementov #####"

arr = [1, 2, 3]
p arr   # [1, 2, 3]
arr << 6
p arr   # [1, 2, 3, 6]

arr.push("item")
p arr  # [1, 2, 3, 6, "item"]  # dobavlyaet v konets massiva znachenie


array = [1,2,3,4,5]
array.insert(1,100)
p array  # [1, 100, 2, 3, 4, 5]  Dobavlyaet d 1 poziciyu element 100, ostalnie sdvigaet vpravo
array.insert(0, 1, 1, 13)  # [1, 1, 13, 1, 100, 2, 3, 4, 5]
p array

a = [1,2,3,4,5]
a.unshift("a", "b", "c")
p a  # ["a", "b", "c", 1, 2, 3, 4, 5] # dobavlyaet nabor znacheniy


puts "##### ARRAYS Manipulyatsii #####"
p [1,2,3,4].length # 4
p [1,2,3,4].size   # 4
p [1,2,3,4].count  # 4

array = [1,2,3,4,5,6,7,1,1,2,3,8]
p array.count{|elem| elem.even?}  # 5  chislo chetnih elementov

p array.count{|elem| elem.odd?}   # 7   chislo nechetnih elementov

p array.count{|elem| elem >= 5 }  # 4 chislo elementov >= 5


array = [4, 5, 7, 8, 1, 5, 3]
p array.sort  # [1, 3, 4, 5, 5, 7, 8]
p ["a", "b", "e", "d", "c"].sort  # ["a", "b", "c", "d", "e"]

#["a", "b", "e", "d", "c", 1, 4, 2, 3].sort  # ERROR

arr = [1, 3, 5]
p arr          # [1, 3, 5]
p arr.reverse  # [5, 3, 1]


a = [1,2,3,4,5]
p a.shuffle  # [4, 3, 1, 5, 2]  Peremeshivaet


mass1 = [1, 2, 3]
mass2 = [6, 7, 8]
massX = mass1 + mass2
p massX  # [1, 2, 3, 6, 7, 8]


p [1,2,3]*3  # [1, 2, 3, 1, 2, 3, 1, 2, 3]

p [1,2,3,3,4,4,5] - [1,2,3,5,6]  # [4, 4]

p [1,2,6,9,100] & [2,34,100]  # [2, 100]  Obschie elementy

p [1,2,6,9,100] & [2,34,100] & [1,100] # 100

array1 = [ 1, 2, 3 ]
array2 = [ 2, 4, 5 ]
p array1 | array2  # [1, 2, 3, 4, 5]  Soedinenie 2 massivov, tolko unikalnie elementy


a = [1,2,3,4]
p a.shift  # 1  Vozvraschaet 1 element i udalyaet ego iz massiva
p a        #[2, 3, 4]


a = [1,2,3,4,5]
p a.delete_at(2)  # 3   Udalenie elementa nomer 2
p a  # [1, 2, 4, 5]


a = [1,2,3,4,5,"bingo"]
p a.drop(3)  # [4, 5, "bingo"]  udalenie pervyh 3 elementov
p a.drop(a.size-1)  # ["bingo"]  Udalenie vseh krome poslednego

a = ["hello",1,2,3]
p a.delete("hello")  # "hello"
p a   # [1, 2, 3]


cities = ["California", "Washington", "Detroit", "New York", "Philadelphia"]
p cities.delete_if{|city| city.length > 8}   # ["Detroit", "New York"]  Udalil vse elementy dlinnee 8 simvolov

a = [1,2,3,3,2,5]
p a.uniq  # [1, 2, 3, 5]  ostavlyaet tolko unikalnye elementy

a =  [1, nil, nil, nil, nil, 2]
p a.compact  # [1, 2]  Udalyaet vse nil

a = [1,2,3,4,5]
p a.clear   # []  Ochischaet massiv

a= [1,2,[3,4,[5,6,7],[8,9]],[10,[11,12]]]
p a.flatten  # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]   Shlopyvanie massiva













