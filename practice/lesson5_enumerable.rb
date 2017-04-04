#!/usr/bin/env ruby

class A
  include Enumerable
  attr_reader :items
  def initialize
    @items = []
  end

  def add(item)
    items << item
  end

  def to_s
    items.join(", ")
  end


  def each(&block)
    items.each(&block)
  end

  def <=> (old, new)
    old.size > new.size
  end

end


a = A.new
a.add("a")
a.add("b")
a.add("c")
p a.items           # ["a", "b", "c"]


puts a.each{|e| p e}
#"a"
#"b"
#"c"
#a
#b
#c

p a.map{|e| "-----#{e}-----"}           # ["-----a-----", "-----b-----", "-----c-----"]

p a.sort        # ["a", "b", "c"]
