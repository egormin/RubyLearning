#!/usr/bin/env ruby

class Mtn
 def writ
   p "class"
 end
end

module A
  class Mtn
    def writ
      p "mod"
    end
  end
  ::Mtn.new.writ      # class
  Mtn.new.writ      # mod
end

#A.new   Nolzya

A::Mtn.new.writ              # mod                 Vyzov modulya
Mtn.new.writ                 # "class"             Vyzov classa
::Mtn.new.writ               # class






# ne tak class MyArray

class MyArray < Array
  def size
    p self.length.to_s          # 3
  end
end
MyArray.new([1,2,3]).size
[1,2,3].size
[1].size + 9



module Rails
  class  Array < ::Array  #nasled ot originalnogo
    def size
      p self.length.to_s
    end
  end
end

  [1,2,3].size
  [1].size + 9

module Rails
  Array.new([1,2,3]).size             # 3          Eto uzhe nash Array (iz 44 stroki)
  p [1].class.ancestors               # [Array, Enumerable, Object, Kernel, BasicObject]
  p Array.new([1,2,3]).class.ancestors   # [Rails::Array, Array, Enumerable, Object, Kernel, BasicObject]
end

#################################

class Mtn1
  def x
    "mtn original"
  end
end

module M1
  def y
    p "y from module"
  end

  def self.z
    p "z from module"
  end

end

class Mtn1
  include M1
end

# Ili mozhno tak
#class Mtn1
#  extend M1
#end
#Mtn1.y  # takoy vyzov pri extend

Mtn1.new.y


puts "#################################"
# Esli odni i te zhe imena

class Mtn2
  def y
    p "mtn2 original"
  end
end


module M2
  def y
    p "y from module2"
  end
end

class Mtn2
  include M2
end

Mtn2.new.y       # "y from module"
# "mtn2 original"
p Mtn2.new.y.class.ancestors            # [String, Comparable, Object, Kernel, BasicObject]

class Mtn3
  prepend M2   # Izmenyaet prioritet i ispolzuet metod s tem zhe imenem iz modulya
end

Mtn3.new.y
# "y from module2"


puts "#################################"

# how to use external modules

require_relative 'my_module'   # put' otnositelno mesta, gde my vyzivaem, naprimer /home
#require ''     ischet v .rvm, zatem v sistemn i t.d.  mozhno i put'
#load 'mtn.rb'

class MyUptime
  include MTN
end

MyUptime.new.uptime

#" 11:22:26 up 3 days, 21:23,  4 users,  load average: 1.70, 1.14, 0.90\n"









