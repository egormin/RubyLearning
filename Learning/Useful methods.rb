#!/usr/bin/env ruby


# https://ru.wikibooks.org/wiki/Ruby/%D0%A1%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D1%87%D0%BD%D0%B8%D0%BA/Object
# https://ruby-doc.org/core-2.2.0/

puts "1 ##### Privedenie tipov #####"
a = 5
p a.class        # Integer

p a.to_s.class   # String
p a.to_c.class   # Complex
p a.to_f.class   # Float

puts "\n2 ##### abs #####"
# Po modulyu
a = -10
p a.abs  # 10

puts "\n3 ##### methods #####"
# pokazivaet vse metody ob'ekta
p a.methods
=begin
[:%, :&, :*, :+, :-, :/, :<, :>, :^, :|, :~, :-@, :**, :<=>, :<<, :>>, :<=, :>=,
   :==, :===, :[], :inspect, :size, :succ, :to_int, :to_s, :to_i, :to_f, :next, :div,
:upto, :chr, :ord, :coerce, :divmod, :fdiv, :modulo, :remainder, :abs, :magnitude, :integer?,
:floor, :ceil, :round, :truncate, :odd?, :even?, :downto, :times, :pred, :bit_length, :digits, :to_r, :numerator,
:denominator, :rationalize, :gcd, :lcm, :gcdlcm, :+@, :eql?, :singleton_method_added, :i, :real?, :zero?, :nonzero?,
 :finite?, :infinite?, :step, :positive?, :negative?, :quo, :arg, :rectangular, :rect, :polar, :real, :imaginary,
 :imag, :abs2, :angle, :phase, :conjugate, :conj, :to_c, :between?, :clamp, :instance_of?, :kind_of?, :is_a?, :tap,
 :public_send, :method, :remove_instance_variable, :define_singleton_method, :instance_variable_set, :public_method,
:singleton_method, :extend, :to_enum, :enum_for, :=~, :!~, :respond_to?, :freeze, :object_id, :send, :display, :nil?,
:hash, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust,
 :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variable_get,
:instance_variables, :instance_variable_defined?, :!, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
=end

puts "\n4 ##### object_id #####"
# id ob'ekta v pamyati
a = [1,2]
p a.object_id   # 20302040

puts "\n5 ##### odd #####"
# Proverka na nechetnost'
p 5.odd?  # true
p 6.odd?  # false

puts "\n6 ##### even #####"
# Proverka na chetnost'
p 5.even?  # false
p 6.even?  # true

puts "\n7 ##### sort #####"
# sortirovka  (dlya massivov)
a = [1, 3, 2]
p a.sort   # [1, 2, 3]

puts "\n8 ##### clone #####"
a = [1, 3, 2]
b = a
b[2] = "X"
p a         # [1, 3, "X"]


a = [1, 3, 2]
b = a.clone
b[2] = "X"
p a         # [1, 3, 2]


puts "\n9 ##### between #####"
# Proverka, nahoditsya li chislo mezhdu zadannymi znacheniyami
a = 10
p a.between?(0, 11)  # true

puts "\n10 ##### include #####"
# Proverka, soderzhitsya li simvol v posledovatel'nosti
a = "abc"
p a.include?("n")  # false

puts "\n11 ##### uniq #####"
a = [1, 2, 1, 3, 2]
# Ostavlyaet tol'ko unikal'nye znacheniya
p a.uniq  # [1, 2, 3]

puts "\n12 ##### compact #####"
# Udalyaet vse nil
a = [1, nil, 2, nil]
p a.compact        # [1, 2]

puts "\n13 ##### pop #####"
# Vydelyaet poslednoy element i udalyaet ego iz massiva
a = [1, 2, 3]
p a.pop        # 3
p a            # [1, 2]

puts "\n14 ##### shift #####"
# Kak i pop tolko vydelyaet pervyi element i udalyaet ego iz massiva
a = [1, 2, 3]
p a.shift
p a

puts "\n15 ##### unshift #####"
# Vstavlyaet elementy v nachalo massiva
a = [1, 2, 3]
p a.unshift("a", "b")    # ["a", "b", 1, 2, 3]

puts "\n16 ##### push #####"
# Vstavlyaet elementy v konets massiva
a = [1, 2, 3]
p a.push("a", "b")    # [1, 2, 3, "a", "b"]


puts "\n17 ##### split #####"
# razdelenie po simvolu
a = "a, b, c"
p a.split(",")  # ["a", " b", " c"]

b = "123"
p b.split(//)  # ["1", "2", "3"]

puts "\n18 ##### join #####"
# Ob'edinenie
a = [1, 2, 3, 2]
p a.join    # "123"

puts "\n19 ##### inspect #####"
# Perevodit v stroku
a = [1, 2, 3, 2]
p a.inspect      # "[1, 2, 3, 2]"

puts "\n20 ##### capitalize #####"
# Delaet pervuyu bukvu bolshoi
a = "abc"
p a.capitalize      # "Abc"

puts "\n21 ##### upcase #####"
# Delaet vse bukvy bolshimi
a = "abc"
p a.upcase      # "ABC"

puts "\n22 ##### downcase #####"
# Delaet vse bukvy malenkimi
a = "abc"
p a.downcase      # "abc"

puts "\n23 ##### reverse #####"
# reverse
a = "abc"
p a.reverse      # "cba"

puts "\n24 ##### size #####"
# Dlina peremennoy
a = "abc"
p a.size     # 3

puts "\n25 ##### swapcase #####"
# Izmenyaet registr na protivopolozhniy
a = "aBc"
p a.swapcase      # "AbC"

puts "\n26 ##### scan #####"
# Proverka na nalichie simvolov v stroke
a = "hello world"
p a.scan('ello')   # "AbC"    # ["ello"]
p a.scan('xx')   # "AbC"      # []

puts "\n27 ##### swapcase #####"
# Izmenyaet registr na protivopolozhniy
a = "aBc"
p a.swapcase      # "AbC"

puts "\n28 ##### delete #####"
# Udalenie simvola iz stroki
a = "aBc"
p a.delete 'B'     # "ac"


puts "\n29 ##### delete #####"
# Pustaya li stroka
a = "aBc"
p a.empty?  # false

puts "\n30 ##### heredoks #####"
# Eto mnogostrochnie peremennye
str = <<ANY
This is a
multiline
ANY
p str   # "This is a\nmultiline\n"

puts "\n31 ##### delete #####"
# Pustaya li stroka
a = "aBc"
p a.empty?  # false


puts "\n32 ##### send #####"
# Preobrazuet stroku v komandu
aaa = "reverse"
bbb = "mytext"
p bbb.send(aaa)   # "txetym"


puts "\n33 ##### & #####"

p ["hello", "good bye"].collect{|arg| arg.upcase}         # ["HELLO", "GOOD BYE"]

# Vot to zhe samoy, tol'ko koroche:
p ["hello", "good bye"].collect(&:upcase)                 # ["HELLO", "GOOD BYE"]


puts "\n34 ##### COUNT #####"
# Podschet kolichestva elementov, udovletvoryayuschih usloviyu
b = {a: 100, b: 200, c: 300, d: 400}
p b.count{|k, v| v > 250}                                  # 2


puts "\n35 ##### ANY? #####"
# Proverka sootvetstviya hotya bi odnogo elementa usloviyu
a = [1, 2, 3, 4, 5]
p a.any?{|e| e > 3}           # true

a = [1,2,3,4,5]
p a.count{|v| v % 2 ==0}                    # 2

p (1..5).count{|v| v**2 >= 16}              # 2


puts "\n36 ##### ALL? #####"
# Proverka sootvetstviya vseh elementov usloviyu
a = [1, 2, 3, 4, 5]
p a.all?{|e| e > 3}           # false


puts "\n37 ##### DETECT #####"
# Find to zhe samoe, chto i detect
# Nahodit pervyi element, kotoryi udovletvoryaet usloviyu

a = [1, 2, 3, 4, 5]
p a.detect{|e| e > 3}           # 4


puts "\n38 ##### SELECT #####"
# Find_all to zhe samoe, chto i select
# Nahodit vse elementy, kotorie udovletvoryaet usloviyu

a = [1, 2, 3, 4, 5]
p a.select{|e| e > 3}           # [4, 5]

puts "\n39 ##### BLOCK_GIVEN? #####"
# Proveryaet byl li peredan blok v metod
def meth5(&block)
  p block_given?
end

meth5             # false
meth5{p "da"}     # true


def meth6(var, &block)
  p block_given?                        # true
  block.call(var) if block_given?
end
meth6("hello"){|val|p val}          # hello
# true
# "hello"

puts "\n40 ##### RESPOND_TO? #####"
# Proveryaet est' li takoy metod u peremennoy

a = 5
p a.respond_to?("inspect")   # true
p a.respond_to?(:inspect)    # true
p a.respond_to?(:bla_bla)    # false


puts "\n41 ##### ALIASES #####"
def testX
  puts "Hello"
end
alias :new_test :testX              # alias :new_name : old_name

new_test        # Hello
testX           # Hello





























