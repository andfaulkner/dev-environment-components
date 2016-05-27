################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ QUICKNAV ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias back="echo 'DIR returning from:'; pwd; popd; echo 'DIR returned to:'; pwd"

alias go_android_tools="pushd ./; cd $HOME/Library/Android/sdk; ls -ao; echo ''; pwd"

alias downloads="pushd ./; cd $HOME/Downloads"
alias documents="pushd ./; cd $HOME/Documents"
alias proj="pushd ./; cd $HOME/projects"
alias anproj="pushd ./; cd $HOME/projects/android"

## super-ls
alias lsa="ls -ao"

## use nvim instead
alias vim="nvim"
## handy vim shortcut
alias v="nvim"

alias devenvedit='vim "$SNIPPETS_DIR/dev-env/devenv-install.sh"'

alias _="\!\!"

function whereami {
    ls -ao
    PWD__TEMP__WHEREAMI=`pwd`
    echo $PWD__TEMP__WHEREAMI
    echo ""
    echo "****************************************************************************"
    echo "current git branch:"
    git status | head -1 | awk '{print $3}'
    echo "****************************************************************************"
    echo ""
    git status
}

function projinfo {
    echo ""
    whereami
    echo ""
    echo *** GEMS INSTALLED IN PROJECT::: ***
    cat Gemfile | ack "^ *gem.*" | sort
    #echo ""
    #echo **** RAKE TASKS AVAILABLE::: ****
    #bundle exec rake -T
}

#alias rbash=". ~/.bash_profile"

function whichdir {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop + "\n"'
}

function newmanual {
    cp "`which man__TEMPLATE`" "`whichdir man__TEMPLATE`/man__$1"
    vim "`whichdir man__TEMPLATE`/man__$1"
}

alias rol_linecount="ruby -ne 'END {puts $.}'"

alias rol_out_linecount="ruby -pe 'END {puts \"\n#{$.}\"}'"

# for use with ps aux - when piped into this, removes references to chrome
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

function show_aliases_mac {
  cat ~/.bashrc > ~/.all_src_scripts_tmp_holder
  cat ~/.bash_profile >> ~/.all_src_scripts_tmp_holder
  cat ~/.
}


# store all scripts in a single temporary file
function list_dir_files {
  #grab all "path to bash source script" containing vars from .bashrc, cat all files within
  rol_get_shdirvars ~/.bashrc | eval cat $(ruby -pe '$_ = "$" + $_' | sudo ack ".sh") > ~/.tmp_bash_source_scripts_storage
  cat ~/.bash_profile >> ~/.tmp_bash_source_scripts_storage
  cat ~/.bashrc >> ~/.tmp_bash_source_scripts_storage
}

#insert text at beginning of file
#Usage:
#    insertfirstline path/to/file.ext "text to insert before 1st line of file"
function insertfirstline {
    echo $2 | cat - $1 > temp && mv temp $1
}

