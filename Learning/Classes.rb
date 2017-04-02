#!/usr/bin/env ruby

# 1) Example 1
class Coffee_machine
  def make_coffee
    puts "gotovim zerna"
    puts "varim cofe"
  end
end

obj = Coffee_machine.new
obj.make_coffee
# gotovim zerna
# varim cofe

# Ili tak
Coffee_machine.new.make_coffee
# gotovim zerna
# varim cofe


# 1) Example 2

class Father
  def check_self(object)
    p self                   # #<Father:0x0000000107e9b8>
    p object                 # "son"
    p object == self         # false


  end
end

son = Father.new
son.check_self("son")



# 2) Example 2 INCAPSULATION
puts "\n##### Example 2 #####"

class Coffee_machine2
  def make_coffee
    get_water(100)
    get_beans(30)
    prepare_beans
    boil_water
    fill_glass
  end

  private                                       # Pole private ostal'nye metody vse privatnye

  def get_water(val)
    puts "Nabiraem #{val} mls vody"
  end

  def get_beans(val)
    puts "Otbiraem iz konteynera #{val} gramm kofe"
  end

  def prepare_beans
    puts "Izmel'chem kofe"
  end

  def boil_water
    puts "Kipyatim vody"
  end

  def fill_glass
    puts "Nalivaem kofe"
  end
end

coffee_obj = Coffee_machine2.new
coffee_obj.make_coffee



# 3) Example 3 INCAPSULATION
puts "\n##### Example 3 #####"
class Cat

  def initialize(options = {})
    @height = options[:height]
    @weight = options[:weight]
  end

  def height
    @height
  end

  def weight
    @weight
  end

  def height=(height)
    @height = height
  end

  def weight=(weight)
    @weight=weight
  end

end

tom = Cat.new({height:10, weight:100})

p tom.height
tom.height = 33
p tom.height

# 10
# 33



# 4) Example 4 NASLEDOVANIE
puts "\n##### Example 4 #####"

class First
  def get_string
    puts "from first"
  end
end

class Second
end

class Third <First
end

First.new.get_string       # from first
#Second.new.get_string     # undefined method `get_string'
Third.new.get_string       # from first


# 5) Example 5 PRIORITETI V NASLEDOVANII
puts "\n##### Example 5 #####"

class First1
  def get_string
    puts "from first"
  end
end

class Third <First
  def get_string
    puts "from third"
  end
end

Third.new.get_string             # from third
# Esli est' metod s takim zhe imenem v klasse iz kotorogo vyzivaem, to vyzovetsyia on, a ne tot, kotoryi nasledovan

# 6) Example 6 PRIORITETI V NASLEDOVANII
puts "\n##### Example 6 #####"

class First2
  def get_string
    puts "from first"
  end
end

class Third2 <First
  def get_string
    super
    puts "from third"
  end

  def method_missing(name)
    puts "A huy ti ugadal s metodom"
  end
end

xxx = Third2.new
xxx.get_string


# 7) Example 7 PARGUMENT MISSING
puts "\n##### Example 7 #####"
class Thor
  def get_string
    super
    puts "from third"
  end

  def method_missing(name)
    puts "Ne suschestvuet metoda #{name} u klassa #{self.class}"
  end
end

Thor.new.vzlomat_sistemu            # Ne suschestvuet metoda vzlomat_sistemu u klassa Thor


#class Test
#  def method_missing(name, arg, &block)
#    if name =~ /count_to/
#      (arg+1).times {|e| print e}
#    end
#  end

# from first
# from third

# Super otsilaet nas k predku, takom obrazom, vypolnitsya kod i iz metoda iz predka i iz tekuschego metoda







