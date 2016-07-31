echo "* Clojure scripts loading..."

alias cloj="ng lein exec" 

alias cloj_run_app="lein run"
alias cloj_compile="lein uberjar"
alias cloj_repl="lein repl"
alias cloj_ring="lein ring server"
alias cloj_run_script="lein oneoff" #name-of-file-here.clj

alias nukeclojure='ps aux | ack "clojure|lein" | awk "{print \$2}" | xargs kill -9'

export VIMCLOJURE_SERVER_JAR="$HOME/bin/nailgun/server-2.3.6.jar"

echo "* Clojure scripts loaded!" 
