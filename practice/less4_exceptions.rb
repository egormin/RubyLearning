#!/usr/bin/env ruby


begin
  1 / 0
  p "ne vypolnitsya"
rescue
  puts "Error"
end
p "end"

# Error
# "end"

# Kogda pishem rescue, podrazumevaem rescue StandartError
p "#######################################"

begin
  1 / 0
  p "ne vypolnitsya"
rescue => err  # peredaem v peremennuyu
  puts "Error"
end
p "end"
p err                 # #<ZeroDivisionError: divided by 0>
p err.backtrace   # ["/ruby/practice/less4_exceptions.rb:19:in `/'", "/ruby/practice/less4_exceptions.rb:19:in `<top (required)>'", "-e:1:in `load'", "-e:1:in `<main>'"]
p err.message         # "divided by 0"

p "#######################################"

begin
  1 / 0
  p "ne vypolnitsya"
rescue ZeroDivisionError=> err  # Vyvodit tol'ko soobsceniya tipa ZeroDivisionError
  puts "Error"
end                  # Error
p ZeroDivisionError.ancestors   # [ZeroDivisionError, StandardError, Exception, Object, Kernel, BasicObject]


p "#######################################"

begin
  1 / 0
  p "ne vypolnitsya"
rescue => err
  p err.message
  p "-" * 20
rescue ZeroDivisionError=> err
  p err.message
end
# "divided by 0"

#rescue TypeError, ZeroDivisionError=> err   Neskol'ko


p "#######################################"
def x(a)
    1 / a
rescue ZeroDivisionError=> err
  p err.message
end

x(0)
# "divided by 0"

# Uproscennyi rescue. Lovit vo vsyom metode


p "#######################################"

def x1
  1 + "1"
rescue TypeError, ZeroDivisionError=> err
  p err.message
  # raise err                # String can't be coerced into Integer (TypeError) Raise sozdaet oshibku
  p "uuu"
end
#"String can't be coerced into Integer"
x1


#raise StandardError   # StandardError (StandardError)
#raise StandardError.new("mazafaka")           # `<top (required)>': mazafaka (StandardError)


p "#######################################"

class MyError < StandardError

end

def x2
  1 + "1"
rescue TypeError, ZeroDivisionError=> err
  p err.message
  raise MyError.new("my error")               # String can't be coerced into Integer (TypeError) Raise sozdaet oshibku
end
#x2      #  my error (MyError)


p "#######################################"

10.times do |i|
  begin
  puts i
  sleep 0.1
  rescue Exception =>e
  puts "NAH"
    end
end
# ^CNAH
# 2
# 3
# ^CNAH
# 4


p "#######################################"
def x3
  begin
  1 + "1"
  p "after"
rescue TypeError, ZeroDivisionError=> err
  p err.message
ensure
  "Vyvedetsya v lyubom sluchae"              # String can't be coerced into Integer (TypeError) Raise sozdaet oshibku
  end
end
x3


p "#######################################"
# retry

file_name = "wrong"
begin
  puts "*" * 30
  puts "open #{file_name}"
  puts IO.read(file_name)
rescue Errno::ENOENT =>e
  puts 'file not found'
  file_name = "/proc/uptime"
  retry
end

# open wrong
#file not found
#******************************
#open /proc/uptime
#340970.80 349621.26

# retry povtorno vypolnit no uzhe vyzovet drugoi file
# Udobno pri organozacii neskolkih popytok


def logger
  yield
rescue StandardError => e    # (rescue =>)  to zhe samoe chto i ()rescue StandardError => e)
  p "Some error:" #{e.class}
end

logger {puts 1}
logger {puts 1/0}

# 1
# "Some error:"

# $!  posledniy vyzvannyi exception



