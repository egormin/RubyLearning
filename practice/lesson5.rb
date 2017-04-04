#!/usr/bin/env ruby

# Rabota s failami
# 1) IO ##################
p IO.read('config.yaml')        # "node : 10.0.0.15\nuser: admin\npassword: admin\nemail_list:\n  - one\n  - two\n  - three\nemail:\n  admin@email.com"

# prednaznachen dlya raboty s nebolshimi tekstovymi dannymi, ne s binarnymi



# 2) PERENAPRAVLENIE POTOKOV ##################
puts "#######"
#$stdout = File.open('stdout.log', 'w')   # esli net faila, to on sozdastsya
puts 1
puts "Hellp world"
# [root@epbyminw2033t2 practice]# cat stdout.log
# 1
# Hellp world
# [root@epbyminw2033t2 practice]#


$stdin = File.open('stdout.log')


puts 'hello'

x = gets
puts x

#1
#Hellp world
#hello
#1

# 3) PERENAPRAVLENIE POTOKOV ##################
puts "#######"

f = File.open('config.yaml')
puts f.read
f.close                # esli ne zakryts' ego, to on zakroetsya gsrb collectorom


#node : 10.0.0.15
#user: admin
#password: admin
#email_list:
#    - one
#- two
#- three
#email:
#    admin@email.com

# 4) FILE.OPEN ##################
puts "#######"

f = File.open('config.yaml', 'a')  # w -write (perezatryot snachala), a -append, r -read
#f.write("hello, world1")   Dobavit stroku k koncu
f.close


File.delete('write.txt') if File.exist?('write.txt')   # Udalenie failov


# 5) FILE.OPEN ################## (Avtomaticheskoe zakrytie)
puts "#######"
File.open('write.txt', 'w') do |f|              # Tut on sam zakroet file
      f.puts("#{Time.now}")
end


# 5) FILE.OPEN ################## (Readline)
puts "#######"

f = File.open('config.yaml')
p f.readline
p f.readline

"node : 10.0.0.15\n"
"user: admin\n"

f.each{|val| p val}
#"node : 10.0.0.15\n"
#"user: admin\n"
#"password: admin\n"
#"email_list:\n"
#"- one\n"
#"- two\n"
#"- three\n"
#"email:\n"
#" admin@email.comhello, world1"

puts "#######"
f = File.open('config.yaml')
while (l = f.gets.chomp) && l != 'email:'
  p l
end

#"node : 10.0.0.15"
#"user: admin"
#"password: admin"
#"email_list:"
#"- one"
#"- two"
#"- three"

puts " 6 #######"
f = File.open('config.yaml')
f.each_line do |l| p l
  break if l == "mail"
end

puts " 7 #######"
#puts File.open('d.d').count{|line| line.start_with?("#")}
# poschitat chislo files nachinayuschihsya s #


puts " 8 #######"
p Dir.exist?("xx")   # false

puts " 9 #######"
p `pwd`
Dir.chdir("..") do
  p Dir.pwd
end
p `pwd`

#"/ruby/practice\n"
#"/ruby"
#"/ruby/practice\n"

p Dir.glob("/*")  # ["/boot", "/dev", "/proc", "/run", "/sys", "/etc", "/root", "/tmp", "/var", "/usr", "/bin", "/sbin", "/lib", "/lib64", "/home", "/media", "/mnt", "/opt", "/srv", "/1", "/temp", "/ruby"]
p Dir.glob("/ru*")    # ["/run", "/ruby"]
p Dir.glob("/ruby/**")  # Recursively ["/ruby/Learning", "/ruby/practice", "/ruby/homeworks"]
p Dir.glob("/ruby/**/**")  # Recursively ["/ruby/Learning", "/ruby/Learning/RubyInstallation_via_rvm", "/ruby/Learning/Operators.rb", "/ruby/Learning/Conditions.rb", "/ruby/Learning/Arrays.rb", "/ruby/Learning/Ranges.rb", "/ruby/Learning/Clas

puts " 10 #######"

#FileUtils.copy
#FileUtils.chdir

puts " 10 #######"

require "pathname"
p Pathname.pwd    # #<Pathname:/ruby/practice>

#File.expand_path('.')

#File.expand_path('../../')
#File.join('..', 'mtn')
#File.join(File.expand_path('./..'), 'mtn')  # Sliyanie puti

#Pathname.new('.') + Pathname.new('../').to_s


puts " 20 #######"
# Vneshnie utility
p `ls -al`              # total 52\ndrwxr-xr-x 3 root root 4096 Apr  4 11:14 .\ndrwxr-xr-x 7 root root

a = '-al'
p `ls #{a}`           #"total 52\ndrwxr-xr-x 3 root root 4096 Apr  4 11:17 .\ndrwxr-xr-x 7 root root   75 Mar 29 10:12 ..\n-rw-r--r-- 1 root root   34 Apr  3 13:00 config2.yaml\n-rw-r--r-- 1 root root  113 Apr  4 10:37 config.yaml\n-rwxr-xr-x 1 root root  112 Mar 28 16:31 first.rb\ndrwxr-xr-x 3 root root  117 Mar 29 10:12 .idea\n-rwxr-xr-x 1 root root 3207 Apr  3 12:57 less4_exceptions.rb\n-rw-r--r-- 1 root root  448 Apr  3 13:19 less4_yaml.rb\n-rw-r--r-- 1 root root 3438 Apr  4 11:17 lesson5.rb\n-rwxr-xr-x 1 root root 2152 Apr  3 11:34 less_test.rb\n-rwxr-xr-x 1 root root   69 Apr  3 11:21 my_module.rb\n-rw-r--r-- 1 root root   21 Apr  4 10:28 stdout.log\n-rwxr-xr-x 1 root root   35 Mar 31 15:02 test1.rb\n-rwxr-xr-x 1 root root  311 Apr  3 17:21 test.rb\n-rw-r--r-- 1 root root   26 Apr  4 11:17 write.txt\n"



p system('ls')
#config2.yaml
#config.yaml
#first.rb
#less4_exceptions.rb
#less4_yaml.rb
#lesson5.rb
#less_test.rb
#my_module.rb
#stdout.log
#test1.rb
#test.rb
#write.txt
#true                 # Esli komanda uspeshna, vyvoditsya true

p system('exit 1')   #  Proverka statusa komand


#exec("ls")
#config2.yaml
#config.yaml
#first.rb
#less4_exceptions.rb
#less4_yaml.rb
#lesson5.rb
#less_test.rb
#my_module.rb
#stdout.log
#test1.rb
#test.rb
#write.txt

puts " 21 #######"
#cmd = 'ping google.com'
#Open3.popen3(cmd) do |stdin, stdout, stderr, wait|
#  status = wait.value
#  unless status.success?
#    abort "aasf"
#  end
#end


puts " 22 #######"
bad = "ls -a; rm -rf test"
p `echo #{bad}`                       # "ls -a\n"
#system("echo #{bad}")
#system("echo", bad)          # luchshe tak razdelyat dlya bezopasnosti, chtoby user ne vvel ls -a; rm -rf test"
#system("ls", "-l")

require 'open3'
#Open3.capture("echo", bad)










