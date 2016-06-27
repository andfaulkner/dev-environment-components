# encoding: utf-8

SOURCE_FILES = Rake::FileList.new('./ch*.md', 'rake_test_files/**/*.markdown',
                                  'rake_test_files/**/*.erk', 'rake_test_files/**/*.md') do |fl|
  fl.exclude('rake_test_files/**/~*')
  fl.exclude(%r{rake_test_files\/scratch\/})
  fl.exclude do |f|
    `git ls-files #{f}`.empty?
  end
end

puts SOURCE_FILES
