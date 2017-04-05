#!/usr/bin/env ruby
puts "\nHello! This is Command Line Interface emulator
Designed by Yegor in 2017\n
To exit programm enter exit\n\n"

class Command
  ALL_COMMANDS = []

  def self.command_by_name(comm)
    sep_com = comm.split(' ')
    class_name = ALL_COMMANDS.find { |e| e.name == sep_com[0] }
    begin
      class_name.new.run(sep_com[1])
    rescue NoMethodError => e
      Logger.common_err('command not found...', e)
    end
  end

  protected

  def say(*args)
    Logger.common_log( "Time: #{Time.now.strftime('%H:%M:%S')}, file: #{$PROGRAM_NAME}, #{args}")
  end
end

class HelpCommand < Command
  def self.name
    'help'
  end

  def self.description
    conf = ConfigData.yaml_config['commands']
    conf[conf.keys.find { |v| v == name }]
  end

  def run(*args)
    if args[0] != nil
      cmd = Command::ALL_COMMANDS.find { |e| e.name == args[0] }
      begin
        say "#{cmd.name} #{cmd.description}"
      rescue NoMethodError => e
        Logger.common_err('wrong argument...', e)
      end
    else
      Command::ALL_COMMANDS.each { |val| say "#{val.name} #{val.description}" }
    end
  end
end

class DateCommand < Command
  def self.name
    'date'
  end

  def self.description
    conf = ConfigData.yaml_config['commands']
    conf[conf.keys.find { |v| v == name }]
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
    conf = ConfigData.yaml_config['commands']
    conf[conf.keys.find { |v| v == name }]
  end

  def run(*args)
    Logger.common_log args[0]
  end
end

class PingCommand < Command
  def self.name
    'ping'
  end

  def self.description
    conf = ConfigData.yaml_config['commands']
    conf[conf.keys.find { |v| v == name }]
  end

  def run(*args)

    if `ping #{args[0]} -c 1 -W 1 &>/dev/null; echo $?`.strip == '0'
      Logger.common_log 'true'
    else
      require 'resolv'
      Logger.common_err((args[0] =~ Resolv::IPv4::Regex) ? 'false' : 'may be wrong ip entered...', ' ')
    end

    # I didn't use this way, because it checks availability only via uri, not ip
    # uri = URI('#{args}')
    # p Net::HTTP.get(uri)
    # p Net::HTTP.get_response(uri)
  end
end

class UptimeCommand < Command
  def self.name
    'uptime'
  end

  def self.description
    conf = ConfigData.yaml_config['commands']
    conf[conf.keys.find { |v| v == name }]
  end

  def run(*args)
    uptime_file_path = '/proc/uptime'
    begin
      uptime_value = IO.read(uptime_file_path).split(' ')[0].to_i
      chasov = uptime_value / 3600
      minut = (uptime_value - chasov * 3600) / 60
      sec = (uptime_value - chasov * 3600) % 60
      Logger.common_log("#{chasov}h, #{minut}min, #{sec}sec")
    rescue SystemCallError => e
      Logger.common_err("File #{uptime_file_path} not found", e)
    rescue => e
      Logger.common_err("Cannot execute the command: #{self.class.name}", e)
    end
  end
end

class ExitCommand < Command
  def self.name
    'exit'
  end

  def self.description
    conf = ConfigData.yaml_config['commands']
    conf[conf.keys.find { |v| v == name }]
  end

  def run(*args)
    p 'Good Bye!'
    Logger.interact_to_log('Exited by command exit')
   exit(0)
  end
end

class ConfigData
  def self.yaml_config
    require 'yaml'
    YAML.safe_load(File.open('cli.yaml'))
  end
end

class Logger
  config = ConfigData.yaml_config
  @err_file = config['error_log']
  @interaction_file = config['output_log']
  @debug_mod = config['debug']
  @debug_mod = 'true' if ARGV[0]

  def self.common_err(text, e)
    errors_write_to_log(text)
    write_to_screen(text, e)
    interact_to_log(text)
  end

  def self.common_log(text)
    write_to_screen(text, nil)
    interact_to_log(text)
  end

  private
  def self.errors_write_to_log(text)
    begin
      File.open(@err_file, 'a') { |f| f.puts "#{`whoami`.strip}: #{Time.now}:  #{text}" }
    rescue
      p 'can not log errors...'
    end
  end

  def self.write_to_screen(text, e)
    p text
    p "#{e.message} #{e.backtrace}" if (@debug_mod && !e.nil?)
  end

  def self.interact_to_log(text)
    if text == 'SESSION STARTED'
      File.open(@interaction_file, 'a') do |f|
      f.puts "#{'=' * 10} #{text} #{Time.now} #{'=' * 10}"
      end
    else
      begin
        File.open(@interaction_file, 'a') { |f| f.puts "#{`whoami`.strip}: #{Time.now}:  #{text}" }
      rescue
        p 'can not log messages...'
      end
    end
  end
end

def greeting
  user = `whoami`.strip
  machine_name = `hostname`.strip
  print user, '@', machine_name, ' #cli >> '
end

Command::ALL_COMMANDS.push(HelpCommand, DateCommand, UptimeCommand, EchoCommand, PingCommand, ExitCommand)
entered_command = ''


Logger.interact_to_log('SESSION STARTED')

while entered_command != 0
  greeting

  begin
    entered_command = STDIN.gets.strip.downcase

    Logger.interact_to_log(entered_command)
  rescue Interrupt => e
    Logger.common_err('Good Bye!', e)
    exit(0)
  end

    Command.command_by_name(entered_command)
end
