eval "$(rbenv init -)"

# close ruby process that just refuses to
alias nukeruby='ps aux | ack "(bin.?ruby)|(puma)" |  awk "{print \$2}" | xargs kill -9'

# install a gem globally
alias geminstg="rvm @global do sudo gem install"

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RAILS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
# Turns off ruby's verbose mode for testing - this just causes useless errors from bugs in gems
alias rake="RUBYOPT=-W0 rake"

# run with puma server by default, it's better
alias rs="rails server puma"
alias beg="rake db:test:prepare; bundle exec guard"
alias rc="rails console"
alias rcs="rails console --sandbox" # any changes made are rolled back on exit
alias rg="rails generate"
alias rgc="rails generate controller"
alias rdm="bundle exec rake db:migrate"
alias rdr="bundle exec rake db:rollback"
alias rreset="bundle exec rake db:migrate:reset"
alias rwipem="rails destroy model" #NameOfModel
alias rwipec="rails destroy controller" #NameOfController #action_1 #action_2 ... #action_n
# alias rgm="rails generate model" #nameOfModelHere #column1:type #col2:type ... col_n: type

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

