#!/usr/bin/env ruby

=begin

###################

##### установить системный Ruby через yum
yum install ruby
yum install ruby-devel rubygems

##### установить новые библиотеки-гемы ‘pry’, ‘sqlite3’
gem install pry
yum install sqlite-devel
gem install sqlite3

gem list

##### удалить гемы
gem uninstall pry
gem uninstall sqlite3

##### удалить системный Ruby
yum remove ruby



###################

### установить Ruby 2.2.1 / 2.2.0 через RVM.

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
bash --login
rvm requirements
rvm -v


rvm install ruby-2.4.1
rvm install ruby-2.2.1
rvm use 2.4.1 --default
rvm list

### создать новый gemset mtn, сделать его дефолтным при заходе в баш
rvm gemset create mtn
rvm gemset use mtn --default

###установить в нем библиотекигемы ‘pry’, ‘sqlite3’
gem install pry
gem install sqlite3
gem list
#####################
=end

