# encoding: utf-8
desc 'Install gems required'
task :install_key_gems do
  puts 'nothing yet'
  # gem_name = 'pandoc'
  # *gem_ver_reqs = 'json', '~> 1.8.0'
  # gdep = Gem::Dependency.new(gem_name, *gem_ver_reqs)
end

deps = %w(pandoc)

namespace :install do
  desc 'What the task actually does'
  task :brews do
    deps.each {|dep| system "brew install #{dep}" }
  end

  desc 'Install system level gems required'
  task :key_gems do
    system
  end
end
