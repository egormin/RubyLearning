#!/usr/bin/env ruby

# def fib(n)
#   return 1 if n <= 2
#
#   fib_index = 3
#   a, b = 1, 1
#
#   while fib_index <= n
#     c = a + b
#     a = b
#     b = c
#     fib_index += 1
#   end
# end
#
# p (1..100).map {|i| fib(i)}

def fibonacci(n)
  a = 0
  b = 1

  # Compute Fibonacci number in the desired position.
  n.times do
    temp = a
    a = b
    # Add up previous two numbers in sequence.
    b = temp + b
  end

  return a
end

50.times do |n|
  result = fibonacci(n)
  p result
end


