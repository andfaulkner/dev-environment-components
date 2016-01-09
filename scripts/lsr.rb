#!/usr/bin/ruby
# home_dir = Dir.home()

require "filesize"

FSIZE_WIDTH = 52

class ArgHandler
    attr_accessor :hide_locked, :hide_hidden, :hide_unhidden, :hide_dirs, :hide_files
    def initialize(args)
        @args = args
        @dash_params = get_dash_params
        handle_dash_params
    end

    private
    def get_dash_params
        @args.reject{|arg| ! /^\-/.match(arg)}.join.gsub("-", "")
    end
    def handle_dash_params
        @hide_locked = @dash_params.include?("l") || false
        @hide_hidden = @dash_params.include?("h") || false
        @hide_unhidden = @dash_params.include?("u") || false
        @hide_files = @dash_params.include?("f") || false
        @hide_dirs = @dash_params.include?("d") || false
    end
end

args = ArgHandler.new(ARGV || "")
puts args.hide_hidden

def list_files
    Dir.glob('*', File::FNM_DOTMATCH)
end

def is_dir?(file)
    Dir.exist?(file)
end

def filter_file_list(hide_hidden, hide_unhidden, hide_dir, hide_files)
    list_files.reject { |file|
        is_dir?(file) if hide_dir
    }.reject { |file|
        file.start_with?(".") if hide_hidden
    }.reject { |file|
        ! file.start_with?(".") if hide_unhidden
    }.reject { |file|
        ! is_dir?(file) if hide_files        
    }
end

def dir_or_file(filename)
    File.stat(filename).directory? ? "d" : "f" 
end

def pretty_file_size(filename)
    file_bytes = "#{File.stat(filename).size}"
    file_size_with_unit = "#{Filesize.from(file_bytes + "B").pretty.ljust(9)}".split(/\s/)
    converted_file_size = file_size_with_unit[0].sub(".00", "")
    file_size_unit = file_size_with_unit[1]
    "#{converted_file_size.ljust(7)} #{file_size_unit.ljust(3)}"
end

def owner_perms(filename)
    readable_char = File.readable?(filename) ? "r" : "-"
    writable_char = File.writable?(filename) ? "w" : "-"
    executable_char = File.executable?(filename) ? "e" : "-"
    "#{readable_char}#{writable_char}#{executable_char}"
end

def world_perms(filename)
    readable_char = File.world_readable?(filename) ? "r" : "-"
    writable_char = File.world_writable?(filename) ? "w" : "-"
    executable_char = File.world_executable?(filename) ? "e" : "-"
    "#{readable_char}#{writable_char}#{executable_char}"
end


def perms(filename)
    "#{owner_perms(filename)} ??? ???"
end

def output_file_list(file_list)
    puts "___|____PERM____|#{"FILENAME".center(FSIZE_WIDTH, "_")}|___SIZE____|"
    file_list.sort.each do | filename |
        # pretty_file_size
        puts "#{dir_or_file(filename)}  |#{perms(filename)} |#{filename.ljust(FSIZE_WIDTH)}|#{pretty_file_size(filename)}|"
    end
    puts "___|____PERM____|#{"FILENAME".center(FSIZE_WIDTH, "_")}|___SIZE____|"
end

output_file_list(filter_file_list(args.hide_hidden, args.hide_unhidden, 
                                  args.hide_dirs,   args.hide_files))
