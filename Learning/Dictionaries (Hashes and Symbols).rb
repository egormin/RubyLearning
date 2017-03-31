#!/usr/bin/env ruby

puts "##### DICTIONARIES #####"

puts "### Sozdaie ###"
a = {}
p a.class         # Hash

a = Hash.new
p a.class         # Hash

a = Hash[]
p a.class         # Hash


hash = {'hello' => 'goodbye', 1 => "Hey!", [1]=>[1,2,3,4,5]}
p hash            # {"hello"=>"goodbye", 1=>"Hey!", [1]=>[1, 2, 3, 4, 5]}
p hash['hello']    # "goodbye"

hash1 = {'one': 5,  'two': "dfgdfg", 'three': [1,2,3]}
p hash1           # {:one=>5, :two=>"dfgdfg", :three=>[1, 2, 3]}

hash2 = {a: 1, b:2, c:3}
p hash2           # {:a=>1, :b=>2, :c=>3}

p hash2[:a]   # 1



puts "##### Symbols #####"
# хранение символов в памяти компьютера происходит так же, как и хранение чисел,
# что позволяет экономить потребление операционной памяти и во время выполнения программы

p :hello_world.class      # Symbol

hash = {:cost => 150, :weight => 200, :color => "green"}
p hash       # {:cost=>150, :weight=>200, :color=>"green"}
# Mozhno i tak i tak
hash = {cost: 150, weight: 200, height: "green"}
p hash       # {:cost=>150, :weight=>200, :height=>"green"}



puts "##### Operacii #####"

# Perestanovka mestami klyuchei i znacheniy
p hash.invert   #   {150=>:cost, 200=>:weight, "green"=>:height}

# Preobrazovanie massiva v hash
array = [1, 2, 3, 4]
p array           # [1, 2, 3, 4]
hash = Hash[*array]
p hash            # {1=>2, 3=>4}


# Preobrazovanie hasha v massiv
p hash.to_a       # [[1, 2], [3, 4]]



hash = {:cost => 150, :weight => 200, :color => "green"}
p hash.keys       # [:cost, :weight, :color]
p hash.values     # [150, 200, "green"]
p hash.key(150)   # :cost    Poisk klyucha po znacheniyu
p hash[:cost]     # 150    Poisk znacheniya po klyuchu