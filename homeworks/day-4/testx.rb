#!/usr/bin/env ruby

class A
  def dd
    @rrr = "hello"
  end
end

class BG <A
  def self.f
    A.@rrr
  end

end

p BG.f

