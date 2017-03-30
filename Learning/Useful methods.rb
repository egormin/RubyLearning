#!/usr/bin/env ruby

puts "##### Privedenie tipov #####"
a = 5
p a.class        # Integer

p a.to_s.class   # String
p a.to_c.class   # Complex
p a.to_f.class   # Float

puts "\n##### abs #####"
# Po modulyu
a = -10
p a.abs  # 10

puts "\n##### methods #####"
# pokazivaet vse metody ob'ekta
p a.methods
=begin
[:%, :&, :*, :+, :-, :/, :<, :>, :^, :|, :~, :-@, :**, :<=>, :<<, :>>, :<=, :>=,
   :==, :===, :[], :inspect, :size, :succ, :to_int, :to_s, :to_i, :to_f, :next, :div,
:upto, :chr, :ord, :coerce, :divmod, :fdiv, :modulo, :remainder, :abs, :magnitude, :integer?,
:floor, :ceil, :round, :truncate, :odd?, :even?, :downto, :times, :pred, :bit_length, :digits, :to_r, :numerator,
:denominator, :rationalize, :gcd, :lcm, :gcdlcm, :+@, :eql?, :singleton_method_added, :i, :real?, :zero?, :nonzero?,
 :finite?, :infinite?, :step, :positive?, :negative?, :quo, :arg, :rectangular, :rect, :polar, :real, :imaginary,
 :imag, :abs2, :angle, :phase, :conjugate, :conj, :to_c, :between?, :clamp, :instance_of?, :kind_of?, :is_a?, :tap,
 :public_send, :method, :remove_instance_variable, :define_singleton_method, :instance_variable_set, :public_method,
:singleton_method, :extend, :to_enum, :enum_for, :=~, :!~, :respond_to?, :freeze, :object_id, :send, :display, :nil?,
:hash, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust,
 :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variable_get,
:instance_variables, :instance_variable_defined?, :!, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
=end

puts "\n##### object_id #####"
# id ob'ekta v pamyati
a = [1,2]
p a.object_id   # 20302040







