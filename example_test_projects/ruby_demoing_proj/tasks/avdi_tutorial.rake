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

# 'enter' new directory to avoid mucking around with file paths
Dir.chdir 'rake_test_files'
files = Rake::FileList['*.erko']

