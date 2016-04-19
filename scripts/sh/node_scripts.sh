################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. ~/.nvm/nvm.sh

alias nrn="npm run nodemon"

alias nrnd="export LOG_LEVEL=debug; npm run nodemon"
alias nrnt="export LOG_LEVEL=trace; npm run nodemon"
alias nrns="export LOG_LEVEL=silly; npm run nodemon"
alias nrne="export LOG_LEVEL=error; npm run nodemon"

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
alias nukenode="killnode; killgulp; killnodemon; killnpm"

alias nukenodesrv="ps aux | grep node | grep -v 'gulp' | awk '{print \$2}' | xargs kill -9"

alias murdernode='ps aux | grep "gulp\|node\|npm" | grep -v "atom" | awk "{print \$2}" | sudo xargs kill -9'
#alias murdernode='ps aux | grep "gulp\|node\|npm" | grep -v "atom" | cut -d" " -f2 | sudo xargs kill -9'
#alias murdernode="ps aux | grep '\(gulp\|node\|npm\)' | grep -v 'atom' | awk '{print $2}' | cut -d' ' -f2 | sudo xargs kill -9"

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

# alias slicesenerr="cat test.txt | sed 's/     at/\n          at/g' | sed 's/trace=/\n\ntrace=/g'| sed 's/column=/\n    ---->COLUMN = /g' | sed 's/\/home\/andfaulkner\/Projects\/testbed\/testbed-seneca--4//g' | sed 's/, execPath=/,\n  execPath=/g' | sed 's/, argv=/,\n  argv=/g' | sed 's/, rss=/,\n  rss=/g' | sed 's/, heapTotal=/,\n  heapTotal=/g' | sed 's/, loadav
#alias slicesenerr="cat test.txt | sed 's/     at/\n          at/g'" 

#enables completion for npm commands in cli
. <(npm completion)

# ensure proper node version loads based on value in .node-version in project folder
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
