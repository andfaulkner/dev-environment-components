# get sizes of all files in all directories in the current directory
alias dirsizes='du -s * | sort -nr'

alias get_pid='awk "{print \$2}"'

function procfind {
    ps aux | ack $1 | ack -v "/usr/bin/ack"
}

function procfindpid {
    echo '----------------------'
    echo "Processes:"
    procfind $1
    echo '----------------------'
    echo 'PIDs only:'
    procfind $1 | awk '{print $2}'
    echo '----------------------'
}

function procfindpid_kill {
    procfind $1 | get_pid | xargs kill -9
}


#alias nukeruby='ps aux | ack "ruby|rails|pry|irb|rack|guard|zeus|rerun|gem[^0-9a-zA-Z_]|rbenv|rake|rspec|minitest|capistrano|thin|puma" | awk "{print \$2}" | xargs kill -9'

alias nukenginx='sudo service nginx stop; ps aux | ack "nginx" | awk "{print \$2}" | xargs kill -9'
alias nukepostgres='sudo service postgresql-9.4 stop; ps aux | ack "postgres" | awk "{print \$2}" | xargs kill -9'
alias nukemysql='sudo service mysql stop; ps aux | ack "mysql" | awk "{print \$2}" | xargs kill -9'
alias nukemongo='sudo service mongodb stop; ps aux | ack "mongod" | awk "{print \$2}" | xargs kill -9'
alias nukedocker='sudo service docker stop; ps aux | ack "docker" | awk "{print \$2}" | xargs kill -9'

alias nukemisc_utils='ps aux | ack "[^a-zA-Z0-9_](cat|less)$" | awk "{print \$2}" | xargs kill -9'

alias nukechrome='ps aux | ack chrome | awk "{print \$2}" | xargs kill -9'
alias nukefirefox='ps aux | ack firefox | awk "{print \$2}" | xargs kill -9'
alias nukesublime='ps aux | ack "[Ss]ublime" | awk "{print \$2}" | xargs kill -9'
alias nukevscode='ps aux | ack "Visual Studio Code\.app" | awk "{print \$2}" | xargs kill -9'

killmatch() {
    ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

# will kill all scripting languages & minor utils
alias clean_mega_level1='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils'
# will kill all scripting languages & minor utils, & nginx
alias clean_mega_level2='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukenginx'
# will kill all scripting languages & minor utils; nginx; postgres, mongodb, and mySQL; and docker;
alias clean_mega_level3='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukedocker; nukepostgres; nukemysql; nukenginx; nukemongo'
# will kill all scripting languages & minor utils; nginx; postgres, mongodb, and mysql; and docker; and chrome and firefox
alias clean_mega_level5='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukedocker; nukepostgres; nukemysql; nukechrome; nukefirefox; nukenginx; nukemongo'
# will kill all scripting languages & minor utils; nginx; postgres, mongodb, and mysql; and docker; chrome and firefox; and sublime
alias clean_mega_level6='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukedocker; nukepostgres; nukemysql; nukechrome; nukefirefox; nukesublime; nukenginx; nukemongo'

# database launchers
alias startpostgres="sudo service postgresql-9.4 start"
alias startmysql="sudo service mysql start"
alias startmysql_mac="mysql.server start"
alias startmongo="sudo service mongodb start"

__CUR_FILE_NAME__=' sys_util_scripts.sh '

# list global aliases defined in scripts automatically loaded on terminal launch (as well as on opening of new terminal windows and tabs)
alias aliases_node="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/node_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_sysutil="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/sys_util_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_search="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/search_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_web="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/web_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_portable_bashrc_additions="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; echo $__CUR_FILE_NAME__; cat \"$SNIPPETS_DIR/scripts/sh/portable_bashrc_additions.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_ruby="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/ruby_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_python="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/python_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""
alias aliases_elixir="echo ''; echo '*************************'; echo $__CUR_FILE_NAME__; echo '*************************'; cat \"$SNIPPETS_DIR/scripts/sh/elixir_scripts.sh\" | ack \"(?<=alias\s)[^=]*=(?=[\\\"\'].*[\\\"\'].*\$)\""


VIMPLUGINS="$HOME/.config/nvim/bundle/"

#alias list_vimplugins="ls -ao $VIMPLUGINS | sed s/^[^:]*:[^a-zA-Z]*//g"
alias list_vimplugins="ls $VIMPLUGINS"

alias goguides='pushd ./; cd "$SNIPPETS_DIR/_docs_guides"'

alias ps_sort_by_res_use="ps aux --sort=pcpu,+pmem"
alias any="ps aux | ack"

# make it impossible to recursively define ln if this file gets loaded in more than once
unalias ln 2>/dev/null
alias ln="ln -s"

alias show_servers_running='lsof -Pni4 | ack "TCP\s\*:[0-9].+\s\(LISTEN\)" | ack -v "Growl|BetterTou|Dropbox"'

alias startpostgres_mac="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

alias curdir='basename "$PWD"'

function atomize {
    echo "./atom/$1"
    ~/bin/atomizr/atomizr -i $1 -o "$1"
}

function todo_add_random {
  cat '- '"$1"'' > "$SNIPPETS_DIR/dev-env/too_random_ideas.txt"
  echo "Added\n- $1 to random ideas todo list"
}

alias read_pdf="open -a Preview.app" #path-to-pdf-here

############ HISTORY ############
#alias history_reduced='ps aux | sort --key 3 | awk \'{if (NF<12) { print \$1",,,"\$2",,,"\$3",,,"\$4",,,"\$9",,,"\$10",,,"\$11} else { print \$1",,,"\$2",,,"\$3",,,"\$4",,,"\$9",,,"\$10",,,"\$11"..." }}\' | column -t -s ",,,"'
alias history_sorted_cpu='ps aux | sort --key 3 | awk "{if (NF<12) { print \$1\",,,\"\$2\",,,\"\$3\",,,\"\$4\",,,\"\$9\",,,\"\$10\",,,\"\$11} else { print \$1\",,,\"\$2\",,,\"\$3\",,,\"\$4\",,,\"\$9\",,,\"\$10\",,,\"\$11\"...\" }}" | column -t -s ",,,"'
alias history_sorted_mem='ps aux | sort --key 4 | awk "{if (NF<12) { print \$1\",,,\"\$2\",,,\"\$3\",,,\"\$4\",,,\"\$9\",,,\"\$10\",,,\"\$11} else { print \$1\",,,\"\$2\",,,\"\$3\",,,\"\$4\",,,\"\$9\",,,\"\$10\",,,\"\$11\"...\" }}" | column -t -s ",,,"'
# eval $(thefuck --alias)

############ DATE / TIME ############
alias now_timestamp="date +%s"
alias timestamp_now="now_timestamp"

# Grab days_in_month util
source "$SNIPPETS_DIR/scripts/sh/tools/days-in-month.sh"

############ COPY / PASTE ############
alias mergefiles__paste="/usr/bin/paste"

alias copy="pbcopy"
alias paste="pbpaste"

alias cbcopy="pbcopy"
alias cbpaste="pbpaste"

alias copytocb="pbcopy"
alias pastefromcb="pbpaste"

alias copy_cli="pbcopy"
alias paste_cli="pbpaste"

alias copycb="pbcopy"
alias pastecb="pbpaste"

alias copy_cli="pbcopy"
alias paste_cli="pbpaste"

alias copystream="pbcopy"
alias pastestream="pbpaste"

alias copy_to_cb="pbcopy"
alias paste_from_cb="pbpaste"

#=== FUNCTION ==========================================================
#        NAME:  tab_title
# DESCRIPTION:  Change the tab title to the given parameter
#   @PARAM $1:  NEW_TITLE What title to change the tab to
#               Run with no param to reset to default
#=======================================================================
function tab_title {
    location "sys_util_scripts.sh"
    local NEW_TITLE=$1
    PROMPT_COMMAND="echo -en \"\033]0;$NEW_TITLE\a\""
}
