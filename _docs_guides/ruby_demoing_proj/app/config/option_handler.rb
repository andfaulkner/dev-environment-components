require 'optparse'

class AppOptions

  def self.parse(args)
    options = {}

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options]"

      # Whether to run the project's singleton_methods experiment
      opts.on("-d", "--[no-]define_singleton_methods",
              "Run experiment showing singleton methods") do |v|
        puts "* Running the singleton methods experiment"
        options[:singleton_experiment] = v
      end

      # Decide whether to launch the Rack server
      opts.on("-s", "--[no-]server", "launch the rack server") do |s|
        puts "* Launching the rack server"
        options[:run_server] = s
      end

      # Define log level. Assigns an ordinal number corresponding to the given level. Each log
      # msg in the app only shows if APP_OPTIONS[:log_level] is >= the msg's required display level
      opts.on("--log_level [LEVEL]", LOG_LEVEL::ALL_OPTIONS,
              "Select log level: verbose, debug, info, warning, error") do |lvl|
        options[:log_level] = LOG_LEVEL::ALL_OPTIONS.reverse.index(lvl) + 1
        (options[:log_level_setup] ||= {}).merge(name: lvl, number: options[:log_level])
      end

      # Output help
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

    end # OptionParser.new do |opts|

    begin
      opts.load('.apprc')
      opts.parse!(args)
    rescue OptionParser::InvalidOption => e
      puts e
      puts opts
      exit(1)
    end
    options
  end # self.parse()

end # class AppOptions
puts ARGV
APP_OPTIONS = AppOptions.parse(ARGV)