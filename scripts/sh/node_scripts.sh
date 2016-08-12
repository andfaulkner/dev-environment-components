################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

echo "* NodeJS scripts loading..."

export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules

alias nrn="npm run nodemon"

alias nrnd="export LOG_LEVEL=debug; npm run nodemon"
alias nrnt="export LOG_LEVEL=trace; npm run nodemon"
alias nrns="export LOG_LEVEL=silly; npm run nodemon"
alias nrne="export LOG_LEVEL=error; npm run nodemon"

alias ni="npm install"

alias mds="make dev-setup"
alias mdsr="make dev-setup; npm run nodemon"
alias mpt="make populate-translations"
alias mpl="make populate-lists"
alias mg="make gulp"
alias eri="make es-reindex-data"

#find version of globally installed package
alias npmpv="npm list -g | grep"

alias nodelist="ls /usr/local/lib/node_modules/; echo '-------------------------------------'; echo 'global node modules location:'; echo '/usr/local/lib/node_modules/'; echo '-------------------------------------';"

#information about npm and node modules [TOADD]
alias npminfo="npm config list"

#list all globally installed node modules [TOADD]
alias npmglist="npm list -g --depth=0"

alias npmkeyinfo="npm config ls -l | grep 'userconfig\|loglevel\|init-module\|cache\s\|^prefix\|shell\|node\-version\|globalignorefile\|globalconfig\|editor\|color' | rev | cut -d';' -f1 | rev | trim; npm config list | grep 'HOME\|cwd\|bin' | rev | cut -d';' -f1 | rev | trim"

#kill all node processes
alias killnode="ps axu | grep node | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"
#alias killnode="ps axu | grep node | awk '{print $2}' | sudo xargs kill -9"

#kill all gulp processes
alias killgulp="ps axu | grep gulp | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"

#kill all nodemon processes
alias killnodemon="ps axu | grep nodemon | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"

#kill all npm processes
alias killnpm="ps axu | grep npm | cut -d' ' -f3 | grep '$' | sudo xargs kill -9"

#kill all node-related processes
alias bombnode="killnode; killgulp; killnodemon; killnpm"

alias nukenodesrv="ps aux | grep node | grep -v 'gulp' | awk '{print \$2}' | xargs kill -9"
alias nukeember="ps aux | grep ember | awk '{print \$2}' | xargs kill -9"

alias murdernode='ps aux | grep "gulp\|node\|npm" | grep -v "atom" | awk "{print \$2}" | sudo xargs kill -9'
#alias murdernode='ps aux | grep "gulp\|node\|npm" | grep -v "atom" | cut -d" " -f2 | sudo xargs kill -9'
#alias murdernode="ps aux | grep '\(gulp\|node\|npm\)' | grep -v 'atom' | awk '{print $2}' | cut -d' ' -f2 | sudo xargs kill -9"

alias ns="nukenodesrv; npm start"

alias __slicesenerr_slicer="sed 's/     at/\n          at/g' | \
                    sed 's/trace=/\n\ntrace=/g'| \
                    sed 's/~\/Projects\/testbed\/testbed-seneca--4//g' | \
                    sed 's/, argv=/,\n    argv=/g' | \
                    sed 's/, rss=/,\n    rss=/g' | \
                    sed 's/, heapTotal=/,\n    heapTotal=/g' | \
                    sed 's/, loadavg=/,\n    loadargv=/g' | \
                    sed 's/ date=/\n    date=/g' | \
                    sed 's/ native=\(true\|false\), / /g' | \
                    sed 's/, stack=/,\n        /g' | \
                    sed 's/column=/\n       |---->COLUMN = /g' | \
                    sed 's/, line=/,\n       \\\---->  LINE = /g' | \
                    sed 's/       |---->COLUMN = /       ______________________________________________________________________________________________________________________\n       |---->COLUMN = /g' | \
                    sed 's/node_modules/\[nm\]/g' | \
                    sed 's/native=false\],/native=false\],\n     _______________________________________________________________________________________________________________________/g' | \
                    sed 's/, execPath=/,\n    execPath=/g' | \
                    sed 's/anonymous function/lambda/g' | \
                    sed 's/, pid=/,\n    pid=/g' | \
                    sed 's/, uid=/,\n    uid=/g' | \
                    sed 's/, gid=/,\n    gid=/g' | \
                    sed 's/, version=/,\n    version=/g' | \
                    sed 's/, uptime=/,\n    uptime=/g' | \
                    sed 's/, heapUsed=/,\n    heapUsed=/g' | \
                    sed 's/, cwd=/,\n    cwd=/g' | \
                    sed 's/trace=\[/  \x1b[31;1mTRACE::\x1b[39;49m/g' | \
                    sed 's/^\(        \)\(\[.*Error: .*,\)/\n\1\x1B[4;32m\2\x1b[0;39;49m/g' | \
                    sed 's/|.*| - error: \(uncaughtException\|\[seneca\]\).*$/\n\n\x1b[1;4;45m\n&::\x1b[0;39;49m\n  \x1b[31;1mENV:\x1b[39;49m/g'"

##### PICKS APART SENECA OUTPUT #####
function slicesenerr {
    cat $1 | __slicesenerr_slicer
}
#Note: '&' in sed in the 'replace' area (s/capture/replace/g) references 
#          whatever was captured in the capture area.
#       '\1' references the 1st parenthesized capture group, \2 the 2nd, and so on
#       see     http://www.grymoire.com/unix/sed.html
#####################################


################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EMBER ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias es="nukeember; ember server"            # start ember server at port 4200
# alias es='eserv | ack -v "(^[0-9]+\serrors?$)|(^.*JSHint.*)|(^[a-zA-Z\._]+.*\.js:\sline\s[0-9]+,\scol\s[0-9]+,\s.*\.)"'
alias esp="ember server --port"    # start ember server at given port #
alias eg="ember generate"          # generate something with ember
alias et="ember test --server"     # run ember tests
alias egr="ember generate route"   # generate route with given name
alias egm="ember generate model" #name_of_model
alias egcom="ember generate component" #name-of-component
alias egcon="ember generate controller" #name-of-controller
alias egh="ember generate helper" #name-of-helper - usually matches a model
alias egserv="ember generate service" #name-of-service
alias egutil="ember generate util" #name-of-util
alias egt="ember generate template" #name-of-template

function egvc {
    ember generate route $1
    # ember generate template $1
    ember generate controller $1
}

function egmvc {
    ember generate route $1s
    # ember generate template $1s
    ember generate model $1
}

function rm_char {
    CHAR_TO_REMOVE = $1
    awk "{gsub(/$1/,\"\",\$0); print \$0}"
    unset CHAR_TO_REMOVE
}

# remove ALL double quotes from a string, from beginning to end
function rm_double_quotes {
    awk '{gsub(/"/,"",$0); print $0}'
}

# list ember addons & dependencies used in current project. Finds package.json,
# extracts info from it.
function emb_proj_deps {
    MAX_LENGTH=$(cat package.json | awk '{print length($1)}' | sort -n | tail -n1)
    cat package.json | ack "\"ember-.+\".?:.?.?\".+\"" | trim | sort | awk '{print $1" "$2}' | column -t -s: | awk '{printf "%'$MAX_LENGTH's    %-11s\n", $1, $2}' | rm_double_quotes
    unset MAX_LENGTH
}

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VERSION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias node_version='echo "$(eval node -v)" > .node-version' # set current version of node as project root node version

# alias slicesenerr="cat test.txt | sed 's/     at/\n          at/g' | sed 's/trace=/\n\ntrace=/g'| sed 's/column=/\n    ---->COLUMN = /g' | sed 's/\/home\/andfaulkner\/Projects\/testbed\/testbed-seneca--4//g' | sed 's/, execPath=/,\n  execPath=/g' | sed 's/, argv=/,\n  argv=/g' | sed 's/, rss=/,\n  rss=/g' | sed 's/, heapTotal=/,\n  heapTotal=/g' | sed 's/, loadav
#alias slicesenerr="cat test.txt | sed 's/     at/\n          at/g'" 

#enables completion for npm commands in cli
. <(npm completion)

# ensure proper node version loads based on value in .node-version in project folder
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

export NVM_DIR=~/.nvm
nvm use v6.3.1

alias ember_dep_surge="rm -rf dist; ember build --environment=development; cd dist; cp index.html 200.html; surge" # if site already exists, provide it here 

# GLOBAL INSTALL
alias nig="npm install -g"

alias nis="npm install --save"
alias nisd="npm install --save-dev"

function react_setup_for_newnode_project {
  npm install react redux react-redux react-dom --save
  npm install 
  cat > .babelrc <<- BABELCONFIG
{
    "presets": ["es2015", "react"]
}
BABELCONFIG

  cat > webpack.config.js <<- WEBPACKCONFIG
var config = {
  context: __dirname + "/BASE_DIRECTORY_FOR_RESOLVING_ENTRY",
  entry: "ENTRY_POINT_FOR_BUNDLE.js -- OR ['entry1.js', 'entry2.js']",
  output: {
    path: __dirname + "",
    filename: "INSERT_OUTPUT_FILE_NAME.js"
  },
  module : {
    loaders : [
      {
        test : /\.jsx?/,
        include : __dirname,
        loader : "babel"
      }
    ]
  }
}
module.exports = config;
WEBPACKCONFIG

    mkdir client
    mkdir server
}

function newnode_project {
    echo "Building new NodeJS project with name $1"
    mkdir $1
    cd $1
    npm init $1 -f
    git init
    npm install --save lodash jquery
    npm install --save fs-extra
    npm install --save moment
    npm install --save-dev gulp webpack gulp-webpack
    npm install --save-dev nodemon
    npm install --save-dev mocha
    npm install --save-dev gulp-mocha
    npm install --save-dev chai
    npm install --save-dev bower
    npm install --save-dev eslint babel-eslint
    npm install --save-dev eslint-plugin-react

    newnode__babel_config_base

    touch Gulpfile

    newnode__webpack "$1"

    touch app.js
    echo "var _ = require('lodash');" > app.js

    echo `node -v` > .node-version

    if [[ -n $2 ]]; then
        if [[ $2 -eq "react" ]]; then
            react_setup_for_newnode_project
        fi
        if [[ $2 -eq "express" ]]; then
            npm install --save express
        fi
    fi
    if [[ -n $3 ]]; then
        if [[ $3 -eq "react" ]]; then
            react_setup_for_newnode_project
        fi
        if [[ $3 -eq "express" ]]; then
            npm install --save express
        fi
    fi

    echo "**/node_modules/**" > .gitignore

    mkdir config
    mkdir scripts
    mkdir bin
    mkdir data
    mkdir data/migrations
    mkdir doc
    
    newnode__mocha_base_install_in_proj 
    newnode__postgres_base_install_in_proj "$1"

    if [[ `redis-cli ping` == "PONG" ]]; then echo "Redis running, ready for use in project"; fi

    newnode_default_eslint

    newnode_sublime_project_base
    open_in_sublime "$1.sublime-project"

    echo "** New NodeJS project created!"
}

function newnode__postgres_base_install_in_proj {
    createdb --user postgres $1
    echo "new database named $1 created"
}

function newnode__webpack {
      cat > webpack.config.js <<- WEBPACKCONFIG
module.exports = {
  context: __dirname + "/BASE_DIRECTORY_FOR_RESOLVING_ENTRY",
  entry: "ENTRY_POINT_FOR_BUNDLE.js -- OR ['entry1.js', 'entry2.js']",
  output: {
    path: __dirname + "",
    filename: "INSERT_OUTPUT_FILE_NAME.js"
  }
}
WEBPACKCONFIG
}

function newnode__mocha_base_install_in_proj {
    npm install --save-dev mocha chai
    mocha init test
    mkdir test
    mv test/tests.js test/test.js
    cp "$TEMPLATES_DIR/mochatestbase.js" "$PWD/test/test.js"
    echo "Mocha test run - ensuring install succeeded:"
    mocha
}

function newnode__sublime_project_base {
    if [[ -n $1 ]]; then
        cp "$TEMPLATES_DIR/project_name.sublime-project" "$PWD/$1.sublime-project"
    else
        cp "$TEMPLATES_DIR/project_name.sublime-project" "$PWD/$(curdir).sublime-project"
    fi
}

function open_in_sublime {
    echo "** opening $1 in sublime text 3"
    sublime --project "$1"
}

function newnode__default_eslint {
    cp "$TEMPLATES_DIR/.eslintrc" "$PWD/.eslintrc"
    echo "default .eslintrc created!"
}

function newnode__babel_config_base {
    cat > .babelrc <<- BABELCONFIG
{
	"presets": ["es2015"]
}
BABELCONFIG
}

# CREATE BASIC NODE PROJECT
function newnode__ultra_basic {
    mkdir "$1"
    cd "$1"

    # BASIC FILES
    newnode__default_eslint "$1"
    newnode__sublime_project_base "$1"
    newnode__postgres_base_install_in_proj "$1"
    newnode__babel_config_base "$1"

    # INITIALIZE PROJECT
    git init
    npm init "$1" -f

    # NPM SETUP
    npm install --save lodash jquery
    npm install --save fs-extra
    npm install --save moment
    npm install --save-dev gulp webpack gulp-webpack
    npm install --save-dev bower
    npm install --save-dev nodemon
    npm install --save-dev eslint babel-eslint
    npm install --save-dev eslint-plugin-react

    # CREATE DIRECTORY STRUCTURE
    mkdir app
    mkdir "test"
    mkdir scripts
    touch app.js
}

echo "* NodeJS scripts loaded!"

alias typescript='find . -name "*.ts" | xargs tsc -w'

alias irjs='"$SNIPPETS_DIR/dev-env/nodejs/irjs/irjs"'

