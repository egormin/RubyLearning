#!/usr/bin/env ruby
puts "\nHello! This is Command Line Interface emulator
Designed by Yegor in 2017\n
To exit programm enter exit\n\n"

class Command
  ALL_COMMANDS = []

  def self.command_by_name(comm)
    sep_com = comm.split(" ")
    class_name = ALL_COMMANDS.find{|e| e.name == sep_com[0]}
    begin
      class_name.new.run(sep_com[1]) #if class_name != nil
    rescue NoMethodError
      Logger.common_err 'command not found...'
    end
  end

  protected
  def say(*args)
    Logger.common_log( "Time: #{Time.now.strftime("%H:%M:%S")}, file: #{$0}, #{args}")
  end

end


class HelpCommand < Command

  def self.name
    'help'
  end

  def self.description
    '- Print help information'
  end

  def run(*args)
    if args[0] != nil
      cmd = Command::ALL_COMMANDS.find{|e| e.name == args[0]}
      begin
        say "#{cmd.name} #{cmd.description}"
      rescue NoMethodError
        Logger.common_err 'wrong argument...'
      end

    else
    Command::ALL_COMMANDS.each{|val| say "#{val.name} #{val.description}"}
    end
  end

end


class DateCommand < Command

  def self.name
    'date'
  end

  def self.description
    '- Print the system date and time'
  end

   def run(*args)
     Logger.common_log Time.now
   end

end


class EchoCommand < Command

  def self.name
    'echo'
  end

  def self.description
    '- Display a line of text'
  end

  def run(*args)
    Logger.common_log args[0]
  end
end


class PingCommand < Command

  def self.name
    "ping"
  end

  def self.description
    '- Send ICMP ECHO_REQUEST to network hosts'
  end

  def run(*args)

    if `ping #{args[0]} -c 1 -W 1 &>0; echo $?`.strip == '0'
      Logger.common_log 'true'
    else
      require 'resolv'
      Logger.common_err( (args[0] =~ Resolv::IPv4::Regex) ? 'false' : 'may be wrong ip entered...')
    end

    # I didn't use this way, because it checks availability only via uri, not ip
    #uri = URI('#{args}')
    #p Net::HTTP.get(uri)
    #p Net::HTTP.get_response(uri)

  end
end


class UptimeCommand < Command

  def self.name
    'uptime'
  end

  def self.description
    '- Tell how long the system has been running'
  end

  def run(*args)
    uptime_file_path = '/proc/uptie'
    begin
      uptime_value = IO.read(uptime_file_path).split(" ")[0].to_i
      chasov = uptime_value / 3600
      minut = (uptime_value - chasov * 3600) / 60
      sec = (uptime_value - chasov * 3600) % 60
      Logger.common_log("#{chasov}h, #{minut}min, #{sec}sec")
    rescue SystemCallError => e
      Logger.common_err ("File #{uptime_file_path} not found")
        p e.backtrace
    rescue
      Logger.common_err ("Cannot execute the command: #{self.class.name}")
    end

  end

end

class ExitCommand < Command

  def self.name
    'exit'
  end

  def self.description
    '- Exit from script'
  end

  def run(*args)
    Logger.interact_to_log('Exited by command exit')
   exit(0)
  end

end


class Logger
  require 'yaml'
  config = YAML.load(File.open("cli.yaml"))

  #p @config
  #err_file = @config['output_log']
  #p err_file
  #p config
  #@err_file = $config['output_log']
  #@err_file = 'error_log'
  @err_file = config['error_log']
  @interaction_file = config['output_log']
  #@interaction_file = "#{(__FILE__).split('.')[0]}.log"
  #@interaction_file =$config["error_log"]


  def self.common_err(text)
    errors_write_to_log(text)
    errors_write_to_screen(text)
    interact_to_log(text)
  end

  def self.common_log(text)
    errors_write_to_screen(text)
    interact_to_log(text)
  end

  private
  def self.errors_write_to_log(text)
    begin
      File.open(@err_file, 'a'){|f|f.puts "#{(`whoami`).strip}: #{Time.now}:  #{text}"}
    rescue
      p "can not log errors..."
    end
  end

  def self.errors_write_to_screen(text)
    p text
  end

  def self.interact_to_log(text)
    if text == 'SESSION STARTED'
      File.open(@interaction_file, 'a') do |f|
      f.puts "#{'=' * 10} #{text} #{Time.now} #{'=' * 10}"
      end
    else
      begin
        File.open(@interaction_file, 'a'){|f|f.puts "#{(`whoami`).strip}: #{Time.now}:  #{text}"}
      rescue
        p 'can not log messages...'
      end
    end
  end

end


def greeting
  user = `whoami`.strip
  machine_name = `hostname`.strip
  print user, '@', machine_name,  '#cli >> '
end

#def yaml_config
#  require 'yaml'
#  $config = YAML.load(File.open('cli.yaml'))
#end

Command::ALL_COMMANDS.push(HelpCommand, DateCommand, UptimeCommand, EchoCommand, PingCommand, ExitCommand)
entered_command = ""

Logger.interact_to_log('SESSION STARTED')

while entered_command != 0
  greeting

  begin
    entered_command = gets.strip.downcase

    Logger.interact_to_log(entered_command)
  rescue Interrupt
    Logger.common_err ('Good Bye!')
    exit(0)
  end

    Command.command_by_name(entered_command)
end
