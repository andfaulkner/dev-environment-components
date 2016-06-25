require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

class OptparseExample

  CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
  CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.library = []
    options.inplace = false
    options.encoding = "utf8"
    options.transfer_type = :auto
    options.verbose = false
    # options.release = "version 1"  <<< this example would add release="version 1" to the output

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"
      opts.default_argv = "hello"
      opts.separator ""
      opts.separator "Specific options:"

      # Mandatory argument. Will grab the string included after the -r argument, and place it in
      # the options.library array. e.g.:
      #     optparse_practice.rb -r hello          --produces-->   options.library=["hello"]
      #     optparse_practice.rb -r hello -r bye   --produces-->   options.library=["hello", "bye"]
      opts.on("-r", "--require LIBRARY", "Require the LIBRARY b4 executing your script") do |lib|
        options.library << lib
      end

      # Cast 'delay' argument to a Float. Throw error if non-numeric arg given. E.g.
      #      optparse_practice.rb --delay 5        --produces-->  delay=4.0
      #      optparse_practice.rb --delay hello    THROWS AN ERROR, it is the wrong type
      opts.on("--delay N", Float, "Delay N seconds before executing") do |n|
        options.delay = n
      end

      # Optional arg w/ keyword completion. Basically an enum, only items in the arr are allowed
      #      optparse_practice.rb --type text      --produces-->  transfer_type=:text
      #      optparse_practice.rb --type asdf      THROWS AN ERROR, it is the wrong type
      opts.on("--type [TYPE]", [:text, :binary, :auto],
              "Select transfer type (text, binary, auto)") do |t|
        options.transfer_type = t
      end

      # List of arguments.
      #      ruby optparse_practice.rb --list w,e,r,t    -->    list=["w", "e", "r", "t"]
      #      ruby optparse_practice.rb --list            THROWS AN ERROR, LIST ITEMS ARE REQUIRED
      opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
        options.list = list
      end

      # Boolean switch. Default argument provided.
      #      ruby optparse_practice.rb -v                verbose=true
      #      ruby optparse_practice.rb --[no-]verbose    verbose=false      
      #      ruby optparse_practice.rb                   verbose=false      
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      # Cast 'time' argument to a Time object.
      #     ruby optparse_practice.rb -t 2016-05-02 23:22:11   -->  time=2016-05-02 00:00:00 -0400
      opts.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
        options.time = time
      end

      # Optional argument; multi-line description.
      opts.on("-i", "--inplace [EXTENSION]", "Edit ARGV files in place", 
              "  (make backup if EXTENSION supplied)") do |ext|
        options.inplace = true
        options.extension = ext || ''
        options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
      end

      # Cast to octal integer.
      opts.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
              "Specify record separator (default \\0)") do |rs|
        options.record_separator = rs
      end

      # Keyword completion. Specifyies a specific set of args (CODES & CODE_ALIASES - note that the
      # latter is a Hash), and the user may provide the shortest unambiguous text.
      #     ruby optparse_practice.rb --code utf8    -->   encoding="utf8"
      #     ruby optparse_practice.rb --code u       -->   encoding="utf8"
      #     ruby optparse_practice.rb --code b       -->   encoding="binary"
      code_list = (CODE_ALIASES.keys + CODES).join(',')
      opts.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
              "  (#{code_list})") do |encoding|
        options.encoding = encoding
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # No matter what else gets inputted, the options summary is what gets outputted.
      # Automatically generated options.
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail("--version", "Show version") do
        puts OptionParser::Version.join('.')
        exit
      end
    end

    begin
      # load from a config file at project root :)
      opts.load('.apprc')
      opts.parse!(args)

    # output usage if invalid params are provided
    rescue OptionParser::InvalidOption => e
      puts e
      puts opts
      exit(1)
    end
    options
  end  # parse()
end  # class OptparseExample

options = OptparseExample.parse(ARGV)
pp options

pp options.ver




# def opt_lint(opts)
#   opts.on('-l', '--[no-]lint', 'Show output of gradle lint') {|lint| @lint = lint }
# end