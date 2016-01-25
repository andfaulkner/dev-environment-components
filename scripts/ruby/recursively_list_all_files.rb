#!/usr/bin/env ruby


# only pick up the actual files
files = Dir.glob("**/*").select{ |file|
	File.file?(file)
}

# gets content of all files, places them in a hash. files is an array of filenames
def filepaths_to_name_content_hash(files)
	files.reduce({}) { |filehash, file_name|
		File.open(file_name) do |myfile|
			lines_array = myfile.reduce([]) { |file_lines, line|
				file_lines.push(line)
				file_lines
			}
			filehash[file_name] = lines_array
			filehash
		end
	}
end

filepaths_to_name_content_hash(files).each{ |filename, filecontent|
	if filecontent.any? {|line| line.match(/.*[^a-zA-Z]{2}function\s.*/) }
		puts "\n********" + filename + "********"
		filecontent.select{ |line|
			if line.match(/.*[^a-zA-Z]{2}function\s+[^\n]/)
				# || 
					# line.match(/.*[^a-zA-Z]{2}class\s.*/)
				puts (line.match(/.*function\s+[^\n\{]*/))
					# || 
					# line.match(/.*class\s.*/)).to_s.gsub('#', '').strip
				line.match(/function/)
			end
		}
	end
}

# files.each {|line| puts line}

# hash_from_files = files.reduce({}) do |total, line|
# 	line_key_value_array = line.chomp.split(":").map{|item|item.strip}
# 	total[line_key_value_array[0]]=line_key_value_array[1]
# 	total
# end
# puts hash_from_file

# puts dirs

# # home_dir = Dir.home()

# # Emits human-readable file information about current directory. Similar to ls.
# # Makes it easy to hide directories, files, "hidden" items, and/or "unhidden" items
# # By default it displays everything.
# # 
# # -d hides directories
# # -f hides files
# # -h hides "hidden" files
# # -u hides "unhidden" files
# #
# # @param [String, #read] contents the contents to reverse 
# # @return [String] the contents reversed lexically 

# require "filesize"

# # 
# # CONSTANTS
# # 

# # Width of 
# FSIZE_WIDTH = 43

# #
# # MODULES
# #

# module TitleSettings
#     TITLE_SETTINGS = {
#         :type=>{ :text=>"T", :width=>3 },
#         :perm=>{ :text=>"PERM", :width=>13 },
#         :name=>{ :text=>"FILENAME", :width=>43 },
#         :size=>{ :text=>"SIZE", :width=>12 }
#     }
# end

# # 
# # CLASSES
# #

# class ArgHandler
#     attr_accessor :hide_locked, :hide_hidden, :hide_unhidden, :hide_dirs, :hide_files
#     def initialize(args)
#         @args = args
#         @dash_params = get_dash_params
#         handle_dash_params
#     end

#     private
#     def get_dash_params
#         @args.reject{|arg| ! /^\-/.match(arg)}.join.gsub("-", "")
#     end
#     def handle_dash_params
#         @hide_locked = @dash_params.include?("l") || false
#         @hide_hidden = @dash_params.include?("h") || false
#         @hide_unhidden = @dash_params.include?("u") || false
#         @hide_files = @dash_params.include?("f") || false
#         @hide_dirs = @dash_params.include?("d") || false
#     end
# end


# class FileHeading

# end

# #
# # Actual list of files. Also creates heading
# # 
# class FileList
#     include TitleSettings
#     attr_reader :header_length
#     attr_accessor :display_cols
#     def initialize(display_cols, title_config = {}, replace = false)
#         if replace == true && ! title_config.empty?
#             @headings=title_config
#         else
#             @headings = TITLE_SETTINGS.merge(title_config)
#         end
#     end

#     # Creates string of repeated chars, with param "width" repeats, of char "uline_char",
#     # which defaults to "_". Used for creating divider under the file grid headings.
#     def uln(width, uline_char = "_")
#         Array.new(width, uline_char).join("")
#     end

#     # Outputs the file grid heading, for display in the terminal.
#     # Uses TITLE_SETTINGS hash to generate it
#     # Example output:
#     #       |___|____PERM____|______FILENAME_____|__SIZE__|
#     def heading_string(uline_char="_")
#         TITLE_SETTINGS.values.reduce { | head, setting |
#             head = head.instance_of?(Hash) ? [col_heading(head, uline_char, true)] : head
#             head.push(col_heading(setting, uline_char))
#             head
#         }.join("")
#     end

#     # Output a single row of data based on the full file data, the width of the column, and the file path
#     def display_row(fdata, path_col_width, file_path)
#         puts "|" + fdata.dir_or_file.center(TITLE_SETTINGS[:type][:width]) + 
#              "  " + fdata.perms.ljust(TITLE_SETTINGS[:perm][:width] - 1) + 
#              "  " + file_path + 
#              "  " + fdata.pretty_filesize.ljust(TITLE_SETTINGS[:perm][:width] - 2) + "|"
#     end

#     # Outputs entire file grid - heading and file data - to the terminal. Display method.
#     def output_file_list(file_list, fileDataClass)
#         puts ""
#         puts Array.new(heading_string().length,"-").join("")
#         puts heading_string()
#         file_list.sort.each do | filename |
#             fdata = fileDataClass.new(filename)
#             path_col_width = TITLE_SETTINGS[:name][:width]
#             file_path = fdata.file_path.ljust(path_col_width-1)
#             display_row(fdata, path_col_width, file_path)
#         end
#         puts Array.new(heading_string().length,"-").join("")
#         puts "" 
#     end

#     private
#     # Handles 1 file grid col's title. col_heading outputs are combined into full heading
#     def col_heading(setting, uline_char, start_pipe = false)
#         title_line = setting[:text].center(setting[:width], uline_char)
#         "#{start_pipe ? '|' : ''}#{title_line}|"
#     end
# end

# #
# # String for a single row of data in the file list
# # 
# class FileOutput
#     include TitleSettings
#     attr_reader :fstat, :file_path
#     def initialize(file_path)
#         @file_path = file_path
#         @fstat = File.stat(@file_path)
#         @file_size_array = file_size_arr(file_bytes)
#     end
#     # determine the raw numeric value representing the file's size in bytes
#     def file_bytes
#         "#{@fstat.size}"
#     end
#     # Convert filesize in bytes into a more readable unit (e.g. MiB) chosen based on size
#     # (e.g. 1048576B = 1.00 MiB, 1024B = 1.00 KiB). Store as array containing new value & unit
#     # Example output:       [1.18, "KiB"]
#     def file_size_arr(file_bytes)
#         @file_size_arr = "#{Filesize.from(file_bytes + "B").pretty.ljust(9)}".split(/\s/)
#     end
#     def pretty_filesize_number
#         @file_size_array[0].sub(".00", "").ljust(7)
#     end
#     def pretty_filesize_unit
#         @file_size_array[1].ljust(3)
#     end
#     # make the file size data human-readable
#     def pretty_filesize
#         fsize_out_arr = file_size_arr(file_bytes)
#         "#{pretty_filesize_number}#{pretty_filesize_unit}"
#     end
#     # determine if path is file or dir, output representing unix char for result
#     def dir_or_file
#         @fstat.directory? ? "d" : "f"
#     end
#     # convert file owner's permissions into unix-idiomatic string ("rwe" flags)
#     def owner_perms
#         readable_char = @fstat.readable? ? "r" : "-"
#         writable_char = @fstat.writable? ? "w" : "-"
#         executable_char = @fstat.executable? ? "e" : "-"
#         "#{readable_char}#{writable_char}#{executable_char}"
#     end
#     # convert "world" permissions into unix-idiomatic string ("rwe" flags)
#     def world_perms
#         readable_char = @fstat.world_readable? ? "r" : "-"
#         writable_char = @fstat.world_writable? ? "w" : "-"
#         # executable_char = @fstat.world_executable? ? "e" : "-"
#         "#{readable_char}#{writable_char}?"
#     end
#     # Create string displaying owner, group, & world perms for a file via "rwe" flags.
#     # Example output:
#     #       rw- r-- ---
#     def perms
#         "#{owner_perms} ??? #{world_perms}"
#     end
# end

# # 
# # FUNCTIONS
# # 

# def list_files
#     Dir.glob('*', File::FNM_DOTMATCH)
# end

# # def is_dir?(file)
# #     Dir.exist?(file)
# # end

# def filter_file_list(hide_hidden, hide_unhidden, hide_dir, hide_files)
#     list_files.reject { |file|
#         Dir.exist?(file) if hide_dir
#     }.reject { |file|
#         file.start_with?(".") if hide_hidden
#     }.reject { |file|
#         ! file.start_with?(".") if hide_unhidden
#     }.reject { |file|
#         ! Dir.exist?(file) if hide_files        
#     }
# end

# file_list = FileList.new([:type, :perm, :name, :size], {:yay=>"YAY!"})
# #
# # SCRIPT RUNS
# #

# args = ArgHandler.new(ARGV || "")

# file_list.output_file_list(filter_file_list(args.hide_hidden, args.hide_unhidden, 
#     args.hide_dirs, args.hide_files), FileOutput)
