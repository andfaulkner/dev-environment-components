#!/usr/bin/env ruby

#
# Outputs the environment variables in a prettier, more readable format.
#
# TODOs:
#   - have it take in CLI arguments (use a module)
#   - CLI arg to specify padding
#   - CLI args to extract individual rows
#   - get separators (between rows) to work
#   - get LS_COLORS to have multiple items display on 1 row (so it's not such a mess)
#

require 'terminal-table'
require 'tty-table'

def split_large_data(name_data_pair, matcher, replacement="\n")
    [name_data_pair[0], name_data_pair[1].strip.gsub(matcher, replacement).to_s]
end

# GET PRETTIER ENVIRONMENT VARIABLES, THEN DISPLAY THEM
env_vars = ENV.reduce [] do |vars, env_var|
    if ['PATH', 'NODE_PATH', 'XDG_DATA_DIRS', 'MANPATH', 'ES_CLASSPATH'].include? env_var[0]
        vars.push(split_large_data(env_var, /:/))
    elsif ['LS_COLORS'].include? env_var[0]
        vars.push(split_large_data(env_var, /;/))
    elsif ['JAVA_OPTS'].include? env_var[0]
        vars.push(split_large_data(env_var, /\s-/, "\n-"))
    elsif ['DBUS_SESSION_BUS_ADDRESS', 'SESSION_MANAGER'].include? env_var[0]
        vars.push(split_large_data(env_var, /\,/))
    else
        vars.push(env_var)
    end
    vars
end

table_3 = TTY::Table.new header: ['VARIABLE', 'VALUE'], rows: env_vars

puts table_3.render :ascii, multiline: true, width: 140, padding: [0,1]