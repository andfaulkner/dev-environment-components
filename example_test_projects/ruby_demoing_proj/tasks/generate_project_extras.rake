# encoding: utf-8

require 'fileutils'

namespace 'generate' do
  desc 'build project folders'
  task :dirs do |t|
    FileUtils.copy_file('Gemfile', './docs/Gemfile') 
    File.delete('./docs/Gemfile')
    # sh 'pand'
    # FileUtils.mkdir_p "poo/poop"
    # FileUtils.copy_file("Gemfile", "Gemfile2")
  end
end

# desc 'Convert all md files in docs folder to html files in docs/html folder'
# task :md_to_html do
#   Dir['docs/*.md'].each do |md_file|
#     sh 'pwd'
#     puts md_file
#     puts "md_file: #{md_file}"
#     puts "html basename: ./docs/html_output/#{File.basename(md_file, '.md')}.html"
#     html_file = 'docs/html_output/' + File.basename(md_file, '.md') + '.html'
#     puts "html_file: #{html_file}"
#     file html_file => md_file do
#       puts "pandoc -o #{html_file} #{md_file}"
#       sh "pandoc -o #{html_file} #{md_file}"
#     end
#   end
# end
