##### ENSURE ALL TERMINALS WRITE TO SINGLE HISTORY FILE #####
#shopt -s histappend;
#PROMPT_COMMAND="history -a;history -c; history -r;$PROMPT_COMMAND"
# Create effectively-infinite-length bash history file
HISTSIZE=500000 HISTFILESIZE=5000000

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~ LOAD OTHER SOURCE SCRIPTS ~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
ANDROID_SCRIPTS="$SNIPPETS_DIR/scripts/sh/android_scripts.sh"
GIT_SCRIPTS="$SNIPPETS_DIR/scripts/sh/git_scripts.sh"
RUBY_SCRIPTS="$SNIPPETS_DIR/scripts/sh/ruby_scripts.sh"
NODE_SCRIPTS="$SNIPPETS_DIR/scripts/sh/node_scripts.sh"
CLOJURE_SCRIPTS="$SNIPPETS_DIR/scripts/sh/clojure_scripts.sh"
PYTHON_SCRIPTS="$SNIPPETS_DIR/scripts/sh/python_scripts.sh"
ELIXIR_SCRIPTS="$SNIPPETS_DIR/scripts/sh/elixir_scripts.sh"
ELM_SCRIPTS="$SNIPPETS_DIR/scripts/sh/elm_scripts.sh"

SYSTEM_UTILITY_SCRIPTS="$SNIPPETS_DIR/scripts/sh/sys_util_scripts.sh"
MISC_CLI_OPTIONS="$SNIPPETS_DIR/scripts/sh/cli_opts.sh"
SEARCH_SCRIPTS="$SNIPPETS_DIR/scripts/sh/search_scripts.sh"
WEB_SCRIPTS="$SNIPPETS_DIR/scripts/sh/web_scripts.sh"
PORTABLE_BASHRC_ADDITIONS="$SNIPPETS_DIR/scripts/sh/portable_bashrc_additions.sh"
TEMPLATES_DIR="$SNIPPETS_DIR/scripts/sh/templates"

source "$SNIPPETS_DIR/scripts/sh/sys_util_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/cli_opts.sh"
source "$SNIPPETS_DIR/scripts/sh/search_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/web_scripts.sh"

# LANGUAGE- OR TOOL-SPECIFIC SCRIPT SOURCES
source "$SNIPPETS_DIR/scripts/sh/android_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/git_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/ruby_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/node_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/clojure_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/python_scripts.sh"
source "$SNIPPETS_DIR/scripts/sh/elixir_scripts.sh"
source "$ELM_SCRIPTS"
source ~/.profile

# EDIT OTHER SCRIPT SOURCES
alias bashrc_android='vim "$SNIPPETS_DIR/scripts/sh/android_scripts.sh"'
alias bashrc_git='vim "$SNIPPETS_DIR/scripts/sh/git_scripts.sh"'
alias bashrc_ruby='vim "$SNIPPETS_DIR/scripts/sh/ruby_scripts.sh"'
alias bashrc_sysutil='vim "$SNIPPETS_DIR/scripts/sh/sys_util_scripts.sh"'
alias bashrc_sysportable='vim "$PORTABLE_BASHRC_ADDITIONS"'
alias bashrc_cli='vim "$SNIPPETS_DIR/scripts/sh/cli_opts.sh"'
alias bashrc_node='vim "$SNIPPETS_DIR/scripts/sh/node_scripts.sh"'
alias bashrc_search='vim "$SNIPPETS_DIR/scripts/sh/search_scripts.sh"'
alias bashrc_web='vim "$SNIPPETS_DIR/scripts/sh/web_scripts.sh"'
alias bashrc_clojure='vim "$SNIPPETS_DIR/scripts/sh/clojure_scripts.sh"'
alias bashrc='vim "$SNIPPETS_DIR/scripts/sh/portable_bashrc_additions.sh"'
alias bashrc_clojure='vim "$SNIPPETS_DIR/scripts/sh/clojure_scripts.sh"'
alias bashrc_elixir='vim "$SNIPPETS_DIR/scripts/sh/elixir_scripts.sh"'
alias bashrc_elm='vim "$ELM_SCRIPTS"'

# LOAD 'MODULES'
source "$SNIPPETS_DIR/scripts/sh/bash_modules/module_File.sh"

# LOAD 'MANUALS'
PATH=$PATH:"$SNIPPETS_DIR/custom-manuals"

################################################################################


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

alias downloads="pushd \"$HOME/Downloads\""
alias documents="pushd \"$HOME/Documents\""
alias proj="pushd \"$HOME/projects\""
alias goproj="pushd \"$HOME/projects\""
alias goprojects="pushd \"$HOME/projects\""
alias anproj="pushd \"$HOME/projects/android\""
alias goelectron="pushd \"$HOME/projects/electron\""

alias godocs="pushd \"$HOME/Documents\""
alias godownloads="pushd \"$HOME/Downloads\""
alias gobinhome="pushd \"$HOME/bin\""

alias govimsetup="pushd \"$HOME.config/nvim/\""

alias go_madutils="pushd \"$HOME/projects/new_node_modules/mad-utils\""
alias gomadutils="go_madutils"
alias goutils="go_madutils"
alias go_utils="go_madutils"

alias go_madlogs="pushd \"$HOME/projects/new_node_modules/mad-logs\""
alias gomadlogs="go_madlogs"
alias go_log_lib="go_madlogs"

## super-ls
alias lsa='ls -ao | grep -v "[0-9][0-9] \.\.\?$"'

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

function whichdir_parent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_grandparent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_greatgrandparent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

function whichdir_greatgreatgrandparent {
    which $1 | ruby -pe '$_ = $_.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop.plit(/[^\/]*$/).first.chop.split(/[^\/]*$/).first.chop + "\n"'
}

alias whichdir_parent_up1="whichdir_parent"
alias whichdir_parent_up2="whichdir_grandparent"
alias whichdir_parent_up3="whichdir_greatgrandparent"
alias whichdir_parent_up4="whichdir_greatgreatgrandparent"

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
  cat "$SNIPPETS_DIR/" >> ~/.all_src_scripts_tmp_holder
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

# get the file extension
# @param $1 - path/to/file.ext
# @returns file extension, excluding the dot. E.g. js
function file.gettext {
    echo "${1##*/}" | awk -F. '{print $NF}'
}

function file.get_first_line {
  cat $1 | awk 'NR==1'
}

function file.get_line { #arg1: filename; arg2: line
  cat $1 | awk "NR==$2"
}

############# Bash completion ###############
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
	. $(brew --prefix)/etc/bash_completion
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#############################################

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load .bashrc file
case $- in
   *i*) source ~/.bashrc
esac

alias vimrc="vim ~/.config/nvim/init.vim"

## Open Sublime Text 3
alias sublime="open /Applications/Sublime\ Text.app"

## Open file in Sublime Text 3
function open_in_sublime {
    echo "** opening $1 in sublime text 3"
    sublime --project "$1"
}

## ps aux | ack ... shorthand
pa() {
    ps aux | ack $1 | ack -v "perl \/.+bin\/ack"
}
