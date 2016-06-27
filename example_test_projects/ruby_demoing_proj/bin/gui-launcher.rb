class GuiLaunchOps
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
      opts.banner = "Usage: bin/gui-launcher.rb [options]"
      # opts.default_argv = ""
      opts.separator ""
      opts.separator "Specific options:"
    end

end