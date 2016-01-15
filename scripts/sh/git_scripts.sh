################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GIT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
echo 'loaded git_scripts.sh!'

alias gaa="git add --all"
alias gca="git commit --all -m"
alias g_po="git push origin"
alias g_remote="git init; git remote add origin" #arg: location of repo
alias g_rro="git remote remove origin"
alias g_rao="git remote add origin" #[place remote repo uri here]
alias g_br="git branch"
alias g_s="git status"
alias g_l=" git log"
alias g_curbr="git branch | ack '\*' | awk '{print \$2}'"
alias g_mybranches="git branch | ack 'ITPL.*[a-zA-Z]' --no-color"
alias g_branchhistory="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname) %(committerdate) %(authorname)' | sed 's/refs\/heads\///g' | awk '{print \$1}' | tail"

function g_diff_br_remote {
  git diff $1 remotes/origin/$1  
}

alias g_diff_remote="g_diff_br_remote $(g_curbr)"

# rubify this, make it check current branch first and only do this if it's on develop after checkout
alias g_resetdev="git stash; git checkout develop; git fetch origin; git reset --hard origin/develop"

# Squash together any number of the most recent commits into 1
# @param $1 - number of commits to squash together (including HEAD, so 1 does nothing)
function g_squash {
    git rebase -i HEAD~$1
}

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

# get the remote repository location
alias g_currepo="git remote -v | xargs ruby -e \"
    puts 'git@andfaulkner.github.com:andfaulkner' + ARGV.find { |arg| 
        /^git@.*:/.match(arg) 
    }.split('/').last
\" 2>/dev/null"

#display name of current git branch
alias g_curbranch="git branch | grep '\*'"
alias curbranch="g_curbranch"
alias gcbr="g_curbranch"

#function reclaimbranch
#git remote add origin git@andfaulkner.github.com:andfaulkner/$1"

