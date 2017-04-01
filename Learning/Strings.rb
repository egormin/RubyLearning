#!/usr/bin/env ruby

# 1) Output
# Bez perenosa stroki
print "Hello"
print "World"
print ("Hello")
#HelloWorldHello"Hello"

print 5, " plus ", 6   # 5 plus 6

# S perenosom stroki
p "Hello"  # "Hello"   v kavychkah
p "World"  # "World"

puts "puts-Hello"  # puts-Hello
puts "puts-World"  # puts-World

# Upravlyayuschis simvoly
print "Hel \n lo"
p "Hel \n lo"    # p ne obrabatyvaet upravlyayuschie simvoly
puts "Hel \n lo"

=begin
Hel
lo"Hel \n lo"
Hel
lo
=end

my_string = "Hello
Glad to
see you"
p my_string  # "Hello\nGlad to\nsee you"

print my_string
#Hello
#Glad to
#see you

puts "Kod, vstroennyi v stroku"
a = "stroka"
res = "String a has #{a.class} type" #=> "String a has String type"
p res  # "String a has String type"

a, b = 1, 5
p "a + b = #{a + b}" # "a + b = 3"
# NO
p 'a + b = #{a + b}'  # "a + b = \#{a + b}"

#str = 'hello 'Chuck'!'  ERROR
str = 'hello \'Chuck\'!' # Right


a = "hello"
p %q!this is a string in single quotes!   # "this is a string in single quotes"
p %q{this is a string in single quotes}   # "this is a string in single quotes"



# 2) Operacii so strokami
puts "1" + "2"  # 12
puts "Conca" << "tenation"   # Concatenation
puts "1" * 5    # 11111

str1 = "A"
str2 = "B"
puts str1 + " and " + str2 + " are cool letters!"   # A and B are cool letters!
puts "#{str1} and #{str2} are cool letters!"        # A and B are cool letters!



aaa = "Hello, "
puts aaa + "World!"  # Hello, World!

p aaa[0]   # "H"
p aaa[-2]  # ","
p aaa[0,2] # "He"
p aaa[0..2] # "Hel"
p aaa[0..-5] # "Hel"

a = "Hello"
a[0] = "Z"
p a   # "Zello"

a[1..5] = "ma"
p a   # "Zma"


# 3) Operacii so strokami (Methods)
aaa = "abcde"
p aaa.upcase   # "ABCDE"
p aaa          # "abcde"    Sama stroka ne izmenilas'

p aaa.upcase!  # "ABCDE"
p aaa          # "ABCDE"    Vmeste s ! izmrnyaetsya i sama stroka

p aaa.downcase  # "abcde"

p aaa.capitalize   # "Abcde"  Delaet tol'ko pervuyu bukvu bolshoi

aaa = "AbCdE"
p aaa.swapcase  # "aBcDe"  Menyaet registr na protivopolozhnyi


aaa = " abcdefg "

p aaa.rstrip   # " abcdefg"
p aaa.lstrip   # "abcdefg "
p aaa.lstrip!.rstrip!     # "abcdefg"

aaa = " abcdefg "
p aaa.strip!   # "abcdefg"   Udalyaet srazu s obeih storon


aaa = "abcdefg"
p aaa.reverse   # "gfedcba"
p aaa.size      # 7   size i length odinakovye
p aaa.length    # 7

p aaa.delete("abc")   # "defg"

p aaa.scan(/d|f/)   # ["d", "f"]   Regulyarnoe vyrazhenie
p aaa.scan(/[^d,f]/)  # ["a", "b", "c", "e", "g"]

aaa = "abcdefg"
p aaa.insert(2, "XXX")   # "abXXXcdefg"   2 - poziciya vstavki. XXX - chto vstavit'

p aaa.empty?  # false  # proveryaet, pustaya li stroka
aaa = ""
p aaa.empty?  # true

p "hello".include?("ll")  # true. Proverka, vhodit li simvol v stroku

puts "a" < "z"    # true

# HEREDOC
str = <<STR
This is a
multiline
STR

p str   # "This is a\nmultiline\n"














