#!/usr/bin/env ruby

###################################################### 1 ######################################################
=begin
Hаписать метод, который принимает аргументом объект типа Proc и возвращает
время затраченное на выполнение данного прока(примитивный бенчмаркинг).
Текущее время можно узнать с помощью Time.now
=end

def benchmark(&block)
  time_before = Time.now
  p "result: #{block.call}"
  time_after = Time.now
  p "Time to processing: #{time_after - time_before}"
end

benchmark{(1..10000000).count{|val|val % 2 ==0}}

# RESULT:
#"result: 5000000"
#"Time to processing: 0.504860981"


###################################################### 2 ######################################################
=begin
дан массив: array = [1, 2, 3, 4]. Написать метод mega_sum, который поддерживает следующее использование:
mega_sum(array) # => 10 # простая сумма элементов
mega_sum(array, 10) # => 20 # сумма всёх элементов + переданное значение
mega_sum(array) { |i| i ** 2} => 30 # сумма элементов с применённым блоком
mega_sum(array, 10) { |i| i **2} => 40 # сумма элементов с применённым блоком + переданное значение
Это всё один метод!
=end



###################################################### 3 ######################################################
=begin
В диапазоне от 1 до 1_000, найти первое трёхзначное число у которого остаток деления на 7 равен 3
=end

p (1..1000).detect{|val| (val % 7 == 3) && (val.to_s.size == 3)}
# RESULT:
# 101


