#!/usr/bin/env ruby
puts "\nHello! This is Command Line Interface emulator
Designed by Yegor in 2017\n
To exit programm enter exit\n\n"

class Command
  ALL_COMMANDS = []    #"help", "uptime", "date", "echo"

  def self.command_by_name(comm)
    sep_com = comm.split(" ")
    #p sep_com[0]
    #p sep_com[1]
    class_name = ALL_COMMANDS.find{|e| e.name == sep_com[0]}
    class_name.new.run(sep_com[1]) if class_name != nil
  end

  protected
  def say(*args)
    puts "Time: #{Time.now.strftime("%H:%M:%S")}, file: #{$0}, #{args}"
  end

end


class HelpCommand < Command

  def self.name
    "help"
  end

  def self.description
    "- Print help information"
  end

  def run(*args)
    if args[0] != nil
      cmd = Command::ALL_COMMANDS.find{|e| e.name == args[0]}
      say "#{cmd.name} #{cmd.description}"
    else
    Command::ALL_COMMANDS.each{|val| say "#{val.name} #{val.description}"}
    end
  end

end


class DateCommand < Command

  def self.name
    "date"
  end

  def self.description
    "- Print the system date and time"
  end

   def run(*args)
    p Time.now
   end

end


class EchoCommand < Command

  def self.name
    "echo"
  end

  def self.description
    "- Display a line of text"
  end

  def run(*args)
    p (args[0])
  end
end


class PingCommand < Command

  def self.name
    "ping"
  end

  def self.description
    "- Send ICMP ECHO_REQUEST to network hosts"
  end

  def run(*args)
    if `ping #{args[0]} -c 1 -W 1 &>0; echo $?`.strip == "0"
      p "true"
    else
      p "false"
    end

    # I don't use this way, because it checks availability only via uri, not ip
    #uri = URI('#{args}')
    #p Net::HTTP.get(uri)
    #p Net::HTTP.get_response(uri)

  end
end


class UptimeCommand < Command

  def self.name
    "uptime"
  end

  def self.description
    "- Tell how long the system has been running"
  end

  def run(*args)
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

Command::ALL_COMMANDS.push(HelpCommand, DateCommand,  UptimeCommand,  EchoCommand, PingCommand)
entered_command = ""

while entered_command != "exit"
  greeting
  entered_command = gets.strip.downcase
  Command.command_by_name(entered_command)

end