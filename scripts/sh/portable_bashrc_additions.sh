function whichdir {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop + "\n"'
}

function newmanual {
    cp `which man__TEMPLATE` `whichdir man__TEMPLATE`/man__$1
    vim `whichdir man__TEMPLATE`/man__$1
}
 
alias rol_linecount="ruby -ne 'END {puts $.}'"

alias rol_out_linecount="ruby -pe 'END {puts \"\n#{$.}\"}'"

function nochrome {
    ruby -pe '$_ = "" if $_.match(/\/opt\/google\/chrome\/chrome/)'
}

# List all shell variables defined in a file that contain a route to a directory
# Excludes PATH variables.
# @param $1 A shell file
function rol_get_shdirvars {
    cat $1 | ack "\/" | ack "^[A-Z]+" | ruby -pe '$_ = $_.split("=").first + "\n"' | uniq | ack -v "^PATH$"
}

# Expand a shell variable - within a pipe
function rol_expand_shdir_vars {
  eval echo $(ruby -pe '$_ = "$" + $_')
}

# get all paths to source $SOME_SOURCE - referenced scripts in a shell file
function rol_get_bash_sources_from_vars {
  cat $1 | ack 'source \$' | eval echo $(ruby -pe '$_ = "$" + $_')
}

# get all paths to source /some/path/here.sh -referenced scripts in a shell file
function rol_get_bash_sources_from_paths {
  cat $1 | ack 'source' | ack -v 'source \$' | awk '{print $2}' | ack -v "rbenv.bash"
}

# show all your aliases
function show_aliases {
  cat ~/.bashrc > ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_vars ~/.bashrc | xargs >> ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_paths ~/.bashrc | xargs >> ~/.all_src_scripts_tmp_holder
  cat ~/.bash_profile >> ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_vars ~/.bash_profile | xargs >> ~/.all_src_scripts_tmp_holder
  rol_get_bash_sources_from_paths ~/.bash_profile | xargs >> ~/.all_src_scripts_tmp_holder
  cat ~/.all_src_scripts_tmp_holder | ack '^alias' | sort
  rm ~/.all_src_scripts_tmp_holder
}

# store all scripts in a single temporary file
function list_dir_files {
  #grab all "path to bash source script" containing vars from .bashrc, cat all files within
  rol_get_shdirvars ~/.bashrc | eval cat $(ruby -pe '$_ = "$" + $_' | sudo ack ".sh") > ~/.tmp_bash_source_scripts_storage
  cat ~/.bash_profile >> ~/.tmp_bash_source_scripts_storage
  cat ~/.bashrc >> ~/.tmp_bash_source_scripts_storage
}
