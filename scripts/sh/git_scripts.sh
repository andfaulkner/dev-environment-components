
alias gaa="git add --all"
alias gca="git commit --all -m"
alias gpo="git push origin"
alias gremote="git init; git remote add origin" #arg: location of repo
alias grro="git remote remove origin"
alias grao="git remote add origin" #[place remote repo uri here]

# SANER GIT BRANCH DISPLAY - only show my own branches
function gitbranches {
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

alias g_currepo="git remote -v | xargs ruby -e \"puts 'git@andfaulkner.github.com:andfaulkner' + ARGV.find{ |arg| /^git@.*:/.match(arg) }.split('/').last\" 2>/dev/null"


#function reclaimbranch
#git remote add origin git@andfaulkner.github.com:andfaulkner/$1"

