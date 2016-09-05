# encoding: utf-8
# rubocop:disable HashSyntax

# EX. 3: FILE LISTS
# ==================
project_root = Dir.pwd

# 'enter' new dir to avoid mucking with file paths (see rake_helpers for how I did this)
# pushd 'rake_test_files'

files_one_level = Rake::FileList['rake_test_files/*.erko']
puts "files - first level: #{files_one_level}"
# => rake_test_files/test1.erko rake_test_files/test2.erko

# select files with a block
erko_files = Rake::FileList.new('**/*.erko') do |fl|
  # exclude all files starting with a tilde - remove them from list
  fl.exclude('rake_test_files/**/~*')
  # exclude all files in a scratch directory
  fl.exclude(/^rake_test_files\/scratch\//)
  # exclude all files not included in git
  fl.exclude do |f|
    `git ls-files #{f}`.empty?
  end
end
puts "final erk filelist: #{erko_files}"
# => final filelist: rake_test_files/level_2_test/test3.erko rake_test_files/test1.erko 
#    rake_test_files/test2.erko

# can also select files like this:
# erko_files = Rake::FileList['**/*.erko']

# return to root directory (again, see rake_helpers)
# popd

task :erk => erko_files.ext('.erk')

rule '.erk' => '.erko' do |fl|
  sh "cp #{fl.source} #{fl.name}"
end
