#!/usr/bin/env ruby
puts "\nHello! This is Command Line Interface emulator
Designed by EG in 2017\n
To exit programm enter exit\n\n"

class Command
  ALL_COMMANDS = [] #"help", "uptime", "date", "echo"
  Command::ALL_COMMANDS.push("HelpCommand", "DateCommand")

 def checking

 end

  protected
  def say(*args)
    p "meth comm"
  end

end


class HelpCommand < Command

  def self.name
    "help"
  end

  def self.description
    "print this text"
  end

  def self.help
    for cmd in Command::ALL_COMMANDS
      #p "iteration: #{cmd}"
      #p "class name of HelpCommand #{p HelpCommand.class.name}"
      p cmd.class
      p cmd

      instance = (Object.const_get(cmd)).new          #################################################
      instance.name


      #p var.class
      #p cmd.send("name")
      #say "#{cmd.name} #{cmd.description}"
    end
  end
  #aaa = "reverse"
  #bbb = "mytext"
  #p bbb.send(aaa)

  def run
    p "CCCCCC"
    #p DateCommand.name
    # for cmd in Command::ALL_COMMANDS
    #   p cmd
    #   p cmd.name
    # end
    HelpCommand.help

  end

end



class DateCommand < Command

  def self.name
    "help"
  end

  def self.description
    "print this text"
  end

  def self.help
    for cmd in Command::ALL_COMMANDS
      say "#{cmd.name} #{cmd.description}"
    end
  end

  def run
   p Time.now
  end
end



class UptimeCommand < Command

  def self.name
    "help"
  end

  def self.description
    "print this text"
  end

  def self.help
    for cmd in Command::ALL_COMMANDS
      say "#{cmd.name} #{cmd.description}"
    end
  end

  def run
    uptime_value = `cat /proc/uptime`.split(" ")[0].to_i
    chasov =  uptime_value / 3600
    minut =  (uptime_value - chasov * 3600) / 60
    sec = (uptime_value - chasov * 3600) % 60
    p "#{chasov}h, #{minut}min, #{sec}sec"
  end

end


def greeting
  user = `whoami`.strip
  machine_name = `hostname`.strip
  print user, "@", machine_name, " #cli >> "
end


entered_command = ""
while entered_command != "exit"

  greeting
  entered_command = gets.strip.downcase
  DateCommand.new.run if entered_command == "date"
  UptimeCommand.new.run if entered_command == "uptime"
  HelpCommand.new.run if entered_command == "help"


  #HelpCommand.new.help






  end





