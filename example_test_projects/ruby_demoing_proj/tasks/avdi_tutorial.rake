# encoding: utf-8
# rubocop:disable HashSyntax

require 'fileutils'

# EX. 1: DEFINE RULES THAT DYNAMICALLY DETERMINE WHAT ACTIONS TO DO ON FILES, THEN PROVIDE FILES
# ==============================================================================================
# just running rake with no params will call this
task :default => [:html, :ok] # << runs BOTH tasks when rake is run 

# define task that tells rake to essentially resolve the dependencies of all files in the array,
# by looking through the rules and seeing what actions to take for that type of file.
task :ok => %w(something.ok)

# Copies from .crap to .ok files. It goes .ok => .crap because rules define
# what DEPENDS ON what, rather than what transforms into what.
rule '.ok' => '.crap' do |t|
  sh "cp #{t.source} #{t.name}"
  # sh "pandoc -o #{t.name} #{t.source}"
end

# A very basic task, full standard
desc 'Remove html & .ok files in root dir'
task :reset do
  FileUtils.rm(Dir.glob('./*.html'))
  FileUtils.rm(Dir.glob('./*.ok'))
end

# EX. 2: CONVERT .md FILES TO .rb FILES
# =====================================
task :html => %w(ch1.html ch2.html ch3.html)

%w(ch1.md ch2.md ch3.md).each do |md_file|
  html_file = File.basename(md_file, '.md') + '.html'
  file html_file => md_file do
    sh "pandoc -o #{html_file} #{md_file}"
  end
end

# EX. 3: FILE LISTS
# ==================
project_root = Dir.pwd

# 'enter' new dir to avoid mucking with file paths (see rake_helpers for how I did this)
pushd 'rake_test_files'

files_one_level = Rake::FileList['*.erko']
puts files_one_level
# => test1.erko
# => test2.erko

files = Rake::FileList['**/*.erko']
puts "files: initial list: #{files}"
# => level_2_test/test3.erko level_2_test/~test4.erko scratch/test5.erko test1.erko test2.erko
files.exclude('~*') # exclude all files starting with a tilde - remove them from list
puts "files after exclusion 1: #{files}"
# => files after exclusion 1: level_2_test/test3.erko scratch/test5.erko test1.erko test2.erko
files.exclude('^scratch\/') # exclude all files in a scratch directory
puts "files after both exclusions: #{files}"
# => files after both exclusions: level_2_test/test3.erko test1.erko test2.erko

# select files with a block instead
files = Rake::FileList.new('**/*.erko') do |fl|
  fl.exclude('~*')
  fl.exclude(/^scratch\//)
  # exclude all files not included in git
  fl.exclude do |f|
    `git ls-files #{f}`.empty?
  end
end
puts "final filelist: #{files}"
# => final filelist: level_2_test/test3.erko test1.erko test2.erko



# return to root directory (again, see rake_helpers)
popd
