# close ruby process that just refuses to
alias nukeruby="ps aux | ack 'bin\/ruby' | awk '{print \$2}' | xargs kill -9"

# install a gem globally
alias geminstg="rvm @global do sudo gem install"

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

