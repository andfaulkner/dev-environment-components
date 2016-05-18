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
alias nukesublime='ps aux | ack sublime | awk "{print \$2}" | xargs kill -9'

# will kill all scripting languages & minor utils
alias clean_mega_level1='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils'
# will kill all scripting languages & minor utils, & nginx
alias clean_mega_level2='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukenginx'
# will kill all scripting languages & minor utils; nginx; postgres, mongodb, and mySQL; and docker;
alias clean_mega_level3='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukedocker; nukepostgres; nukemysql; nukenginx'
# will kill all scripting languages & minor utils; nginx; postgres, mongodb, and mysql; and docker; and chrome
alias clean_mega_level5='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukedocker; nukepostgres; nukemysql; nukechrome; nukenginx'
# will kill all scripting languages & minor utils; nginx; postgres, mongodb, and mysql; and docker; chrome; and sublime
alias clean_mega_level6='nukeruby; nukenode; nukelisp; nukepython; nukemisc_utils; nukedocker; nukepostgres; nukemysql; nukechrome; nukesublime; nukenginx'

alias startpostgres="sudo service postgresql-9.4 start"
alias startmysql="sudo service mysql start"
alias startmongo="sudo service mongodb start"
