# encoding: utf-8
# frozen_string_literal: true
# options parser handling
require 'optparse'

# Handle arguments passed to app launcher
class AppOptions
  def parse(args)
    @options = {}

    config = OptionParser.new do |opts|
      opts = subapp_opt(opts)
      opts = rack_opt(opts)
      opts = log_level_opt(opts)
      help_opt(opts)
    end # OptionParser.new do |opts|

    begin
      config.load('.apprc')
      config.parse!(args)
    rescue OptionParser::InvalidOption => e
      puts e
      puts opts
      exit(1)
    end
    assign_option_defaults
  end # self.parse()

  private

  def assign_option_defaults
    @options ||= { log_level: 3, subapp: false, run_server: false }
    @options[:log_level] ||= 3
    @options[:subapp] ||= false
    @options[:run_server] ||= false
    @options
  end

  def subapp_opt(opts)
    opts.on('-s',
            '--subapp [TYPE]',
            [:drb_server, :drb_consumer, :rack_server, :singleton_experiment, :pty_experiment],
            'Select sub-app to launch: drb_server, drb_consumer, rack_server, \
                singleton_experiment') do |t|
      puts "Selected subapp: #{t}"
      @options[:subapp] = t
    end
  end

  # Decide whether to launch the Rack server
  def rack_opt(opts)
    opts.on('-s', '--[no-]server', 'launch the rack server') do |s|
      puts '* Launching the rack server'
      @options[:run_server] = s ? s : false
    end
  end

  # Define log level. Assigns an ordinal number corresponding to the given level. Each log
  # msg in the app only shows if APP_OPTIONS[:log_level] is >= the msg's required display level
  def log_level_opt(opts)
    opts.on('--log_level [LEVEL]', LOG_LEVEL::ALL_OPTIONS,
            'Select log level: verbose, debug, info, warning, error') do |lvl|
      @options[:log_level] = LOG_LEVEL::ALL_OPTIONS.reverse.index(lvl) + 1
      (@options[:log_level] ||= {}).merge(name: lvl, number: @options[:log_level])
    end
  end

  # Display help message
  def help_opt(opts)
    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
    opts
  end
end # class AppOptions

puts ARGV

APP_OPTIONS = AppOptions.new.parse(ARGV)

puts APP_OPTIONS
