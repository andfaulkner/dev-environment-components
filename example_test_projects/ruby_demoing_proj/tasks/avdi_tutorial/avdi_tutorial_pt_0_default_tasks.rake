# encoding: utf-8
# rubocop:disable HashSyntax

# EX. 1: LIST TASKS TO RUN BY DEFAULT
# just running rake with no params will call this
task :default => [:html, :htm, :erk, :ok] # << runs ALL tasks when rake is run