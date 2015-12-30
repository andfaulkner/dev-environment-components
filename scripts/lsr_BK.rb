#!/usr/local/bin/ruby
# home_dir = Dir.home()

# Emits human-readable file information about current directory. Similar to ls.
# Makes it easy to hide directories, files, "hidden" items, and/or "unhidden" items
# By default it displays everything.
# 
# -d hides directories
# -f hides files
# -h hides "hidden" files
# -u hides "unhidden" files
# 
# @param [String, #read] contents the contents to reverse 
# @return [String] the contents reversed lexically 

require "filesize"

# 
# CONSTANTS
# 

# Width of 
FSIZE_WIDTH = 35

# 
# CLASSES
# 

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

# .map {|filename| FileOutput.new(filename)}

class FileOutput
    attr_reader :fstat, :file_path
    def initialize(file_path)
        @file_path = file_path
        @fstat = File.stat(@file_path)
    end
    def is_dir?
        Dir.exist?(@file_path)
    end
    def dir_or_file
        @fstat.directory? ? "d" : "f"
    end
    def pretty_file_size
        file_bytes = "#{@fstat.size}"
        file_size_with_unit = "#{Filesize.from(file_bytes + "B").pretty.ljust(9)}".split(/\s/)
        converted_file_size = file_size_with_unit[0].sub(".00", "")
        file_size_unit = file_size_with_unit[1]
        "#{converted_file_size.ljust(7)} #{file_size_unit.ljust(3)}"
    end
    def owner_perms
        readable_char = @fstat.readable? ? "r" : "-"
        writable_char = @fstat.writable? ? "w" : "-"
        executable_char = @fstat.executable? ? "e" : "-"
        "#{readable_char}#{writable_char}#{executable_char}"
    end
    def world_perms
        readable_char = @fstat.world_readable? ? "r" : "-"
        writable_char = @fstat.world_writable? ? "w" : "-"
        # executable_char = @fstat.world_executable? ? "e" : "-"
        "#{readable_char}#{writable_char}?"
    end
    def perms
        "#{owner_perms} ??? #{world_perms}"
    end
end


# 
# FUNCTIONS
# 

def list_files
    Dir.glob('*', File::FNM_DOTMATCH)
end

# def is_dir?(file)
#     Dir.exist?(file)
# end

def filter_file_list(hide_hidden, hide_unhidden, hide_dir, hide_files)
    list_files.reject { |file|
        Dir.exist?(file) if hide_dir
    }.reject { |file|
        file.start_with?(".") if hide_hidden
    }.reject { |file|
        ! file.start_with?(".") if hide_unhidden
    }.reject { |file|
        ! Dir.exist?(file) if hide_files        
    }
end

def output_file_list(file_list)
    puts "___|____PERM____|#{"FILENAME".center(FSIZE_WIDTH, "_")}|___SIZE____|"
    file_list.sort.each do | filename |
        fn = FileOutput.new(filename)
        # pretty_file_size
        puts "#{fn.dir_or_file}  |#{fn.perms} |#{fn.file_path.ljust(FSIZE_WIDTH)}|#{fn.pretty_file_size}|"
    end
end

#
# SCRIPT RUNS
#

args = ArgHandler.new(ARGV || "")
puts args.hide_hidden

output_file_list(filter_file_list(args.hide_hidden, args.hide_unhidden, 
                                  args.hide_dirs,   args.hide_files))