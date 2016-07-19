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
alias nukenode='ps aux | ack "node|gulp|npm|nvm|grunt|cordova|mocha|webpack|babel|livereload" | awk "{print \$2}" | xargs kill -9'
alias nukelisp='ps aux | ack "clisp" | awk "{print \$2}" | xargs kill -9'
alias nukepython='ps aux | ack python | ack -v "[^0-9].python" | awk "{print \$2}" | xargs kill -9'

alias nukenginx='sudo service nginx stop; ps aux | ack "nginx" | awk "{print \$2}" | xargs kill -9'
alias nukepostgres='sudo service postgresql-9.4 stop; ps aux | ack "postgres" | awk "{print \$2}" | xargs kill -9'
alias nukemysql='sudo service mysql stop; ps aux | ack "mysql" | awk "{print \$2}" | xargs kill -9'
alias nukemongo='sudo service mongodb stop; ps aux | ack "mongod" | awk "{print \$2}" | xargs kill -9'
alias nukedocker='sudo service docker stop; ps aux | ack "docker" | awk "{print \$2}" | xargs kill -9'

alias nukemisc_utils='ps aux | ack "[^a-zA-Z0-9_](cat|less)$" | awk "{print \$2}" | xargs kill -9'

alias nukechrome='ps aux | ack chrome | awk "{print \$2}" | xargs kill -9'
alias nukefirefox='ps aux | ack firefox | awk "{print \$2}" | xargs kill -9'
alias nukesublime='ps aux | ack sublime | awk "{print \$2}" | xargs kill -9'

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

alias startpostgres="sudo service postgresql-9.4 start"
alias startmysql="sudo service mysql start"
alias startmysql_mac="mysql.server start"
alias startmongo="sudo service mongodb start"

VIMPLUGINS=$HOME/.config/sublime-text-3/Packages/User/snippets/dev-env/vim_configs/.vim/bundle

#alias list_vimplugins="ls -ao $VIMPLUGINS | sed s/^[^:]*:[^a-zA-Z]*//g"
alias list_vimplugins="ls $VIMPLUGINS"

alias goguides='pushd ./; cd "$SNIPPETS_DIR/_docs_guides"'

alias ps_sort_by_res_use="ps aux --sort=pcpu,+pmem"

# make it impossible to recursively define ln if this file gets loaded in more than once
unalias ln 2>/dev/null
alias ln="ln -s"

alias show_servers_running='lsof -Pni4 | ack "TCP\s\*:[0-9].+\s\(LISTEN\)" | ack -v "Growl|BetterTou|Dropbox"'

alias startpostgres_mac="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
