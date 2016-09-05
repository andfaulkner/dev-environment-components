# encoding: utf-8
# rubocop:disable HashSyntax

require "./tasks/avdi_tutorial/source_files"

# EX. 5: Pathmaps
# ===============
# Pathmap: Rake power tool for munging filenames. A pathmap takes as its argument a specification,
# which is a string containing codes corresponding to different parts of the original filenames.
#
# Codes in the specification:
# %p      gives the whole original path               e.g. rake_test_files/level_2_test/test3.erko
# %f      gives filename without directory portion    e.g. test3.erko
# %n      renders file base name without dir or ext   e.g. test3
# %d      gives directory but not file name           e.g. rake_test_files/level_2_test
# %x      gives file extension only                   e.g. .erko
# %X      gives everything BUT the extension          e.g. rake_test_files/level_2_test/test3

puts "SOURCE FILES VIA %p: #{SOURCE_FILES.pathmap('%p')}"
puts "SOURCE FILES VIA %f: #{SOURCE_FILES.pathmap('%f')}"
puts "SOURCE FILES VIA %n: #{SOURCE_FILES.pathmap('%n')}"
puts "SOURCE FILES VIA %d: #{SOURCE_FILES.pathmap('%d')}"
puts "SOURCE FILES VIA %x: #{SOURCE_FILES.pathmap('%x')}"
puts "SOURCE FILES VIA %X: #{SOURCE_FILES.pathmap('%X')}"

desc 'Create mirror directory structure - i.e. a new identical tree'
task :mirror_dir_structure do
  SOURCE_FILES.pathmap('%d').each do |path|
    puts File.join('new_struct/level_2/', path)
    # puts mkdir.to_s
    mkdir_p(File.join('new_struct/level_2/', path))
  end
  SOURCE_FILES.pathmap('%p').each do |path|
    sh "cp #{path} new_struct/level_2/#{path}"
  end
end
