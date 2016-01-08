################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GIT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
alias gaa="git add --all"
alias gca="git commit --all -m"
alias gpo="git push origin"
alias g_remote="git init; git remote add origin" #arg: location of repo
alias grro="git remote remove origin"
alias grao="git remote add origin" #[place remote repo uri here]

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

#function reclaimbranch
#git remote add origin git@andfaulkner.github.com:andfaulkner/$1"

