export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

# close ruby process that just refuses to
alias killruby='ps aux | ack "(bin.?ruby)|(puma)" |  awk "{print \$2}" | xargs kill -9'
alias rubypocalypse='ps aux | ack "ruby|passenger" | awk "{print \$2}" | xargs kill -9'

# install a gem globally
alias geminstg="rvm @global do sudo gem install"

alias localgems='cat Gemfile | ack "^ *gem.*" | sort'

alias bir="bundle install; rbenv rehash"


########## AKR-SPECIFIC KILLS ############
alias killakr3="ps aux | ack rails | ack -v '3001' | awk '{print \$2}' | xargs kill -9; ps aux | ack rails | ack -v '3001'"
alias ka="killakr3"

alias berspec="bundle exec rake spec"

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RAILS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
# Turns off ruby's verbose mode for testing - this just causes useless errors from bugs in gems
alias rake="RUBYOPT=-W0 rake"

# run with defined server
alias rs="bundle exec rails server"
alias rsakr="killakr3; bundle exec rails server"
# run with puma server
alias rsp="bundle exec rails server puma"
alias beg="bundle exec rake db:test:prepare; bundle exec guard"
alias rc="bundle exec rails console"
alias rcs="bundle exec rails console --sandbox" # any changes made are rolled back on exit
alias rg="bundle exec rails generate"
alias rgc="bundle exec rails generate controller"
alias rdm="bundle exec rake db:migrate"
alias rgmig="bundle exec rails generate migration" #AddSomecolumnToSometable #colname:coltype
alias rdr="bundle exec rake db:rollback"
alias rreset="bundle exec rake db:migrate:reset"
alias rwipem="bundle exec rails destroy model" #NameOfModel
alias rwipec="bundle exec rails destroy controller" #NameOfController #action_1 #action_2 ... #action_n
# alias rgm="rails generate model" #nameOfModelHere #column1:type #col2:type ... col_n: type

alias resetakr3="ps aux | ack rails | ack -v '3001' | awk '{print \$2}' | xargs kill -9; ps aux | ack rails | ack -v '3001'; bundle exec rails server"
alias killrakeworker="ps aux | ack 'rake jobs:work' | awk '{print \$2}' | xargs kill -9; ps aux | ack 'rake jobs:work'"
alias bir="bundle install; rbenv rehash"

alias cut_timestamp="lsa | awk '{print \$8}' | ruby -ne 'puts \$_.split(\"\n\").map{|fn|fn.split(\"_\")[1...-1].join(\"_\")}'"

# reduce annoying ruby error messages
alias be="RUBYOPT=-W0 bundle exec"

# view all rake tasks
alias bert="RUBYOPT=-W0 bundle exec rake -T"

# run rake
alias ber="RUBYOPT=-W0 bundle exec rake"

# db migration status
alias berms="RUBYOPT=-W0 bundle exec rake db:migrate:status"

# I've typed this too many times
alias bi="bundle install"

alias ber="be rake"
# display tasks
alias bert="be rake -T"

alias berm="be rake db:migrate"
alias berms="be rake db:migrate:status"

alias belisttests="find `pwd`/spec \*\.rb | awk '{print $1}' | ack -v '\.$' | ack -v '^[0-9]{1,3}$' | ack -v ':$' | ack -v \"^$\" | xargs cat > tmptmptmp.txt; cat tmptmptmp.txt | ack \"(context)|(^[^a-zA-Z0-9_#]*it[^a-zA-Z0-9_])|([^#a-zA-Z0-9_]describe[^a-zA-Z0-9_])\""

# run with puma server
alias rsp="bundle exec rails server puma"

alias rreset="bundle exec rake db:migrate:reset"
alias rreset_db_full_DANGER="bundle exec rake db:migrate:reset"

alias rjw="bundle exec rake jobs:work"
alias berjw="bundle exec rake jobs:work"
alias rw="killrakeworker; rjw"

# view all running ruby processes
alias rubyps='ps aux | ack "ruby|rails|guard|rake|rack|puma|passenger|rbenv|irb|pry|bundler|rerun|rspec|zeus"'
alias psruby='rubyps'
#alias bombruby='rubyps | awk "{print \$2}" | xargs kill -9'

# generate model. Provides instructions and typechecking 
function rgm {
    if [ -z "$2" ]
    then
        echo "Usage: rgm NameOfModel COL1:type [COL2:type] ... [COL_n:type]"
        echo " Example: rgm Users name:string birthday:date age:integer married:boolean"
        echo " Example: rgm BankAccounts bank:string amount:decimal last_use:timestamp"
        echo " Example: rgm Product description:text price:decimal release:datetime"
    else
        args=("$@")
        ELEMENTS=${#args[@]}
        for ((i=0; i<$ELEMENTS;i++)); do
            if [[ "$i" -gt 0 ]]
            then
                if [[ ${args[${i}]} != *":"* ]]
                then
                    echo "you must provide a type for params passed to the model generator"
                    return 0
                fi
            fi
        done
        rails generate model "$@"
        echo "model generation successful!"
    fi
    echo "exiting..."
}

alias rr="rake routes"
alias gorails="cd /home/andrew/projects/ruby/rails"

#### MYSQL ####
alias msqlstart="mysql.server start"

#=== FUNCTION ==========================================================
#        NAME:  rubify
# DESCRIPTION:  convert an rb file into a standalone executable
#   @PARAM $1:  file to convert 
#=======================================================================
function rubify {
    MAKERUBYEXE_FILE_EXTENSION=$(echo $(getfileext $1));
    MAKERUBYEXE_FIRSTLINEOFRUBYFILE=$(cat $1 | awk 'NR==1')

    echo '----- First line of file -----'
    echo $MAKERUBYEXE_FIRSTLINEOFRUBYFILE
    echo '------------------------------'
    echo 'file extension: '$MAKERUBYEXE_FILE_EXTENSION 

    # check for file types that must not be converted into a ruby executable
    if [ $MAKERUBYEXE_FILE_EXTENSION != "js" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "html" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "sublime-project" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "sublime-workspace" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "md" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "css" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "scss" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "less" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "dust" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "pdf" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "exe" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "tar" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "zip" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "rar" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "sh" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "doc" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "docx" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "odt" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "json" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "lock" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "vim" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "sql" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "h" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "cpp" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "torrent" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "mp3" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "mp4" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "tgz" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "jpg" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "run" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "rar" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "gif" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "png" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "mpg" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "torrent" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "avi" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "hpp" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "cset" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "c" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "Makefile" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "Dockerfile" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "yml" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "gz" ] && [ $MAKERUBYEXE_FILE_EXTENSION != "ini" ] && \ 
       [ $MAKERUBYEXE_FILE_EXTENSION != "txt" ]; then
        echo "File extension is not forbidden - treating file as ruby script"

        if [ "$MAKERUBYEXE_FIRSTLINEOFRUBYFILE" == "#!/usr/bin/ruby" ]; then
            echo "Already an executable ruby file, making no changes"
        else
            echo "Inserting shebang to make ruby file a standalone executable"
            insertfirstline $1 "#!/usr/bin/env ruby"
            chmod +x $1
        fi
    else
        echo $1" is not a ruby script; cannot convert into standalone ruby executable"
        echo "    - file extension must be .rb"
    fi
}

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ online manuals ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias manol_rbenv="curl https://raw.githubusercontent.com/rbenv/rbenv/master/README.md"
