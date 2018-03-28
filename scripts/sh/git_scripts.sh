################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GIT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
echo '* git scripts loading...'
alias g="git"
alias gpom="git push origin master"
alias gpo="git push origin"
alias ga="git add"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gca="git commit --all -m"
alias gaca="git add --all; git commit --all -m"
alias g_po="git push origin"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gb="git branch"
alias g_br="git branch"
alias gbr="git branch"
alias gcob="git checkout -b"
alias gs="git status"
alias gl="git log"
alias gamend="git amend"
alias g_amend="git amend"
alias g_am="git amend"
alias gam="git amend"
alias gapy="git add package.json yarn.lock"

alias g_c="git commit"

alias gpocur='echo "$(g_curbr)" | xargs git push origin'

alias g_geturl_origin="echo '======'; echo 'origin'; echo '======'; git remote get-url origin"
alias g_seturl_origin="git remote set-url origin" #url of repo here

alias g_master="git checkout master"

#alias g_curbr="git rev-parse --abbrev-ref HEAD"
alias g_curbr="git status | head -1 | awk '{print \$3}'"
#alias g_curbr="git status | head -1 | awk '{print \$3}'"
#display name of current git branch
#alias g_curbr="git branch | ack '\*' | awk '{print \$2}'"
alias g_mybranches="git branch | ack 'ITPL.*[a-zA-Z]' --no-color"
alias g_branchhistory="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname) %(committerdate) %(authorname)' | sed 's/refs\/heads\///g' | awk '{print \$1}' | tail"

alias g_co_lastedited='echo "$(g_branchhistory | tail -n 1)" | xargs git checkout'
alias g_co_2ndlastedited='echo "$(g_branchhistory | tail -n 2 | rev | tail -n 1 | rev)" | xargs git checkout'


alias g_tag_rm="git tag -d"
alias g_tag_new="git tag"
alias g_tags_my="git tag | ack AF"

tag_v_publish() {
    tir package.json --replace "\"version\": \"[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\"," "\"version\": \"$1\","
    tir package.json --replace "\.git#v[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\"" ".git#v$1\""
    git add package.json
    git commit -m "Bump to version $1"
    git push origin master
    git tag v$1; #v0.22.2
    gpo v$1; #v0.22.2;
    npm publish
}

#=== FUNCTION ==========================================================
#        NAME:  gat
# DESCRIPTION:  Add a typescript file to git staging
#   @PARAM $1:  Name of file to add
#=======================================================================
function gat {
    location "git_scripts.sh"
    local NAME_OF_FILE_TO_ADD=$1

    git add "*$NAME_OF_FILE_TO_ADD*.ts*"
}

# function g_diff_remote {
#  CURRENT_BRANCH=$(echo $(g_curbr))
#  echo $CURRENT_BRANCH
#  git diff $CURRENT_BRANCH remotes/origin/$CURRENT_BRANCH
#}

# alias g_diff_remote="g_diff_br_remote \$(g_curbr)"

# rubify this, make it check current branch first and only do this if it's on develop after checkout
# alias g_resetdev="git stash; git checkout develop; git fetch origin; git reset --hard origin/develop"

# Reset all staged changes to unstaged
alias g_resethead="git reset HEAD"
alias g_reset_staged_to_unstaged="g_resethead"
alias g_resethead_all="g_resethead"
alias grh="g_resethead"

# Convert previous git commit into a set of staged but uncommited local files, and remove the commit from the git history.
alias g_reset_last_commit_keep_local_changes="git reset --soft HEAD~1"

alias gsa="git stash apply"
alias gstash="git stash"
alias gsta="git stash"

# Squash together any number of the most recent commits into 1
# @param $1 - number of commits to squash together (including HEAD, so 1 does nothing)
function g_squash {
    git rebase -i HEAD~$1
}

alias g_diff_files_changed='git diff `g_curbr` develop | ack "^\-{3}"'
alias gd="git diff"

# SANER GIT BRANCH DISPLAY - only show my own branches
function g_branches {
    DASHESLINE='--------------------------------------------------------------------------------------';
    echo '';
    echo $DASHESLINE;
    echo -e 'REMOTE AND LOCAL GIT BRANCHES:'
    git branch -a |
        ack '(remotes\/origin\/)?(ITPL-[1-9][0-9]{2,3}\-.*-)' --no-color --sort-files |
        sed 's/remotes\/origin\//RO - /' |
        sed 's/^\*\s/CUR - /' |
        sort -nr |
	sed 's/CUR\s-\s/--------------------------------------------------------------------------------------\n CURRENT BRANCH:\n   * /g';	
    echo $DASHESLINE;
    echo '';
}

function g_diff_br_remote {
  git diff $1 remotes/origin/$1  
}

function g_diff_cur_rem {
    CURRENT_BRANCH_FOR_DIFF=`g_curbr`
    echo $CURRENT_BRANCH_FOR_DIFF;
    git diff `g_curbr` remotes/origin/`g_curbr` 
}

gcmcw() {
    if [ -n "$1" ] && [ -n "$2" ]; then
        LAST_CANWEB_COMMIT=$1
        echo "Commit message: CANWEB-$1: $2"
        git commit -m "CANWEB-$1: $2"
        echo "Set currently active bug number for 'gcmcw' to $LAST_CANWEB_COMMIT"

    elif [ -n "$1" ] && [ -n "$LAST_CANWEB_COMMIT" ]; then
        echo "Commit message: CANWEB-$LAST_CANWEB_COMMIT: $1"
        git commit -m "CANWEB-$LAST_CANWEB_COMMIT: $1"

    elif [ -n "$1" ] && [ ! -n "$LAST_CANWEB_COMMIT" ]; then
        echo ""
        echo "USAGE:   gcmcw ISSUE_NUMBER \"Commit message\""
        echo "EXAMPLE: gcmcw 123 \"My first commit with CANWEB-123 issue\""
        echo "Note: No gcmcw issue number currently active. To set it & run in future"
        echo "      uses without the 1st param, run gcmcw with a number at least once"
        echo ""

    else
        echo ""
        echo "USAGE:"
        echo "    With new issue number:"
        echo "        gcmcw ISSUE_NUMBER \"Commit message\""
        echo "    With already-set issue number $LAST_CANWEB_COMMIT:"
        echo "        gcmcw \"Commit message\""
        echo ""
    fi
}

alias g_tree='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

# get the remote repository location
alias g_repo="git remote -v | xargs ruby -e \"
    puts 'git@andfaulkner.github.com:andfaulkner' + ARGV.find { |arg| 
        /^git@.*:/.match(arg) 
    }.split('/').last
\" 2>/dev/null"


# SETUP - RARELY USED
alias g_remote="git init; git remote add origin" #arg: location of repo
alias g_rro="git remote remove origin"
alias g_rao="git remote add origin" #[place remote repo uri here]

alias gcom="git checkout master"

alias gpull="git pull"
alias g_pullom="git pull origin master"
alias g_pullm="git pull origin master"
alias gpullm="g_pullom"
alias gpullom="g_pullom"

#function reclaimbranch
#git remote add origin git@andfaulkner.github.com:andfaulkner/$1"

echo '* git scripts loaded!'
