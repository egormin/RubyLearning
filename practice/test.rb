#!/usr/bin/env ruby

chislo = 1000





result  = [1, 1]
i = 0

while result.size <= chislo
  if i == 0 || i == 1
    i+=1
    next
  end
  result << result[i-2] + result[i-1]

  i+=1
end

p result