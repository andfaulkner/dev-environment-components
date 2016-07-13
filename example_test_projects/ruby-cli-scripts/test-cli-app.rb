#!/usr/bin/env ruby
# encoding: utf-8

require 'trollop'
require 'table_print'

require './scripts/script-helpers'

# rubocop:disable HashSyntax
opts = Trollop.options do
  version 'test-cli app 0.1'
  banner unindent(<<-EOS)
    Example CLI tool using trollop for options

    Usage:
            ./test-cli-app.rb [options] <filenames>+
    where [options] are:
  EOS
  # flag   --verbose, default false
  opt :verbose,      'Be verbose'
  # flag   --verbose, default false
  opt :show_table,   'Show a table'
  # string --app-name <s>, default nil
  opt :app_name,     'Give the app a name',             :type => :string
  # string --ruby-version <i>, default to 2.3.1
  opt :ruby_version, 'Choose ruby version for project', :type => :string, :default => '2.3.1'
  # float --ruby-version <i>, default to 2.3
  opt :proj_version, 'Choose project version',          :type => :float,  :default => 0.1
end

# rubocop:enable HashSyntax
unless opts[:ruby_version] =~ /^[\d][\d]?\.[\d][\d]?(\.[\d][\d]?)?$/
  Trollop.die :ruby_version, 'Must specify a semver Ruby version'
end

p opts

