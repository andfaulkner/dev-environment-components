echo "  -> npm publishing/versioning/deployment scripts loading..."

########################################## NPM VERSIONING ##########################################
# Increase the current node version
function bump_node {
    tir "$HOME/Library/Application Support/Sublime Text 3/Packages/User/SublimeLinter.sublime-settings" --replace "\.nvm\/versions\/node\/v[0-9]\.[0-9]\.[0-9]\/" ".nvm/versions/node/v$1/"
    tir "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings" --replace "\.nvm\/versions\/node\/v[0-9]\.[0-9]\.[0-9]\/" ".nvm/versions/node/v$1/"
}

# Get npm package version from current project
alias npm_get_package_version="jq '.version' package.json | tr -d '\"v'"

# Set package.json version to given value
function npm_set_package_version() {
    if [ -n "$1" ]; then
        local VERSION_NUMBER="$(echo $1 | tr -d '\"v')"
        jq ".version = \"$VERSION_NUMBER\"" package.json | sponge package.json
    else
        echo "npm_set_package_version requires a version number"
        echo "Usage:    npm_set_package_version VERSION_NUMBER"
        echo "Example:  npm_set_package_version 1.5.21"
    fi
}

# Create git tag with current version (from package.json)
function npm_git_tag_w_ver() {
    git tag v"$(jq .version package.json | tr -d '\"')"
}

######################################### MODULE SEARCHING #########################################
# Module lists
alias npm_hasmodule='cat package.json | ack'
alias npm_mymodules='cat package.json | ack --no-color "\"((mad-logs)|(mad-utils)|(@ottawamhealth\/canimmunize-kavalinscript)|(env-var-helpers)|(common-constants))\"":'
alias mymoduleversions='npm_mymodules'
alias npm_mymodulesall='cat package.json | ack --no-color "\"((mad-logs)|(mad-utils)|(@ottawamhealth\/[a-zA-Z-_$]+)|(kidnap-console)|(env-var-helpers)|(errorcatcher)|(common-constants))\"":'

######################################## PRs AND DEPLOYMENT ########################################
#=== FUNCTION ==========================================================
#        NAME:  g_pr
# DESCRIPTION:  Quickly create a PR to given branch, from current branch
#   @PARAM $1:  Branch to PR to (from current branch)
#   @PARAM $2:  Title of new Pull Request
#=======================================================================
function g_pr {
    location "git_scripts.sh"
    if [ ! -z "$1" ] || [ ! -z "$1" ]; then
        hub pull-request -h `g_curbr` -b $1 --message="$2"
    else
        echo "Error: g_pr requires 2 string arguments"
        echo ""
        echo 'Usage [g_pr]  ::  g_pr branch-to-pr-to-from-cur-branch "Pull Request Title HERE"'
    fi
}

# Create PR from master into dev
alias g_pr__master_to_dev='hub pull-request -h master -b dev --message="[DEPLOYMENT] master->dev" -f'
# Create PR from dev into qa
alias g_pr__dev_to_qa='hub pull-request -h dev -b qa --message="[DEPLOYMENT] dev->qa" -f'
# Create PR from qa into uat
alias g_pr__qa_to_uat='hub pull-request -h qa -b uat --message="[DEPLOYMENT] qa->uat" -f'

# Checkout a branch, then sync it to its remote version (pull, then push in case a local merge occurred)
function git_checkout_sync_branch() {
    if [ -n "$1" ]; then
        git checkout $1
        git fetch origin $1
        git merge -s recursive -X theirs origin/$1 -m "Merge from remote $1 branch [AUTOCOMMIT]"
        git push origin $1

        # git checkout $1
        # git pull origin $1 -m "Merged from remote $1 branch"
        # git push origin $1
    else
        echo "USAGE: git_checkout_sync_branch BRANCH/BranchToCheckoutPullAndPush"
    fi
}

# Create "deployment" PR from first branch into second, with package version
# Optionally bump package to given version (arg #3) before PR creation
function __g_deploy_branch1_to_branch2__ {
    git_checkout_sync_branch $1
    if [ -n "$3" ]; then
        jq ".version = \"$3\"" package.json | sponge package.json
        git add ./package.json
        git commit -m "Bump package.json to v$3 [AUTOCOMMIT]"
        git merge -s recursive -X ours origin/$1 -m "Merge from remote $1 branch after v$3 deploy to $2 [AUTOCOMMIT]"
        git push origin $1
    fi
    local VERSION="$(npm_get_package_version)" # Get npm package version
    hub pull-request -h $1 -b $2 --message="[DEPLOYMENT] {v$VERSION} $1 -> $2" -f
}

# Create deployment PR from master to dev branch (optional arg: new version #)
# e.g. g_deploy_master_to_dev 0.5.2
alias g_deploy_master_to_dev="__g_deploy_branch1_to_branch2__ master dev"

# Create deployment PR from dev to qa branch (optional: new version #)
alias g_deploy_dev_to_qa="__g_deploy_branch1_to_branch2__ dev qa"

# Create deployment PR from qa to uat branch (optional: new version #)
alias g_deploy_qa_to_uat="__g_deploy_branch1_to_branch2__ qa uat"

# Create deployment PR from qa to uat branch (optional: new version #)
alias g_deploy_uat_to_prod="__g_deploy_branch1_to_branch2__ uat prod"

function _wait_2_min_w_info_during_deploy {
    sleep 120
    echo "$1 min passed (out of 11min wait)"
}

function _git_postdeployment_backmerge {
    echo "Waiting 11min for deploy to finish..."
    _wait_2_min_w_info_during_deploy 2
    _wait_2_min_w_info_during_deploy 4
    _wait_2_min_w_info_during_deploy 6
    _wait_2_min_w_info_during_deploy 8
    _wait_2_min_w_info_during_deploy 10
    # Merge back-commits into original branch after deployment
    git checkout $1
    git add .
    git commit -a -m "Local changes to $1 branch before deploy to $2 [AUTOCOMMIT]"
    git fetch origin $1
    git merge -s recursive -X theirs origin/$1 -m "Merge from remote $1 branch after deploy to $2 [AUTOCOMMIT]"
    git push origin $1
	git checkout $2
}

function g_deploy_full_master_to_uat {
    if [ ! -n "$1" ]; then
        echo "USAGE: g_deploy_full_master_to_uat VERSION"
    else
		# Deploy master -> dev
        g_deploy_master_to_dev $1
		# Merge changes deployment made to master
		_git_postdeployment_backmerge master dev

        # Wait for deploy to finish
        # sleep 660
        # Merge in back-commits from deployment
        # git checkout master
        # git add .
        # git commit -a -m "LOCAL CHANGES TO master BRANCH PRE-DEPLOY TO dev [AUTOMATIC BRANCH]"
        # git fetch origin master
        # git merge -s recursive -X theirs origin/master
		# git push origin master
        
        # Deploy dev -> qa
        g_deploy_dev_to_qa $1
		# Merge changes deployment made to dev
		_git_postdeployment_backmerge dev qa
        # Wait for deploy to finish
        # sleep 660
        # Merge in back-commits from deployment
        # git checkout dev
        # git add .
        # git commit -a -m "LOCAL CHANGES TO dev BRANCH PRE-DEPLOY TO qa [AUTOMATIC BRANCH]"
        # git fetch origin dev
		# git merge -s recursive -X theirs origin/dev
		# git push origin dev

        # Deploy qa -> uat
		g_deploy_qa_to_uat $1
		# Merge changes deployment made to qa
		_git_postdeployment_backmerge qa uat		
		# Wait for deploy to finish
		# sleep 660
        # Merge in back-commits from deployment
        # git checkout qa 
        # git add .
        # git commit -a -m "LOCAL CHANGES TO qa BRANCH PRE-DEPLOY TO uat [AUTOMATIC BRANCH]"
        # git fetch origin qa
        # git merge -s recursive -X theirs origin/qa
        # git push origin qa

		# Return to master
		git checkout master
    fi
}

######################################## MODULE PUBLISHING #########################################
#=== FUNCTION ==========================================================
# Full publication workflow for npm utility modules
#   1. Change the version & the tag on the repo url in package.json to the given semver number
#   2. Add, commit, and push the package.json change to master,
#         commit message states what version it's being bumped to
#   3. Create a git tag with said number (preceded by v), and push it to github.
#   4. Publish the package to npm
#
# EXAMPLE: npm_tag_publish_version 0.31.2
#   - Results in package.json:
#      ...
#      "repository": {
#          "type": "git",
#          "url": "git+https://github.com/andfaulkner/misc-ts-utils-isomorphic.git#v0.31.2"
#      },
#      "version": "0.31.2"
#      ...
#   - Commits change to package.json in master branch with message 'Bump to version 0.31.2'
#   - creates git tag v0.31.2
#   - publishes package version 0.31.2 to npm
#
# Note: requires 'tir' text replacement utility to be in your environment
#=======================================================================
npm_tag_publish_version() {
    tir package.json --replace "\"version\": \"[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\"," "\"version\": \"$1\","
    tir package.json --replace "\.git#v[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\"" ".git#v$1\""
    rm ./package.json__bk # Remove automatic backup file created by tir
    git add package.json
    git commit -m "Bump to version $1"
    git push origin master
    git tag v$1;
    git push origin v$1;
    npm publish
    echo "Published v$1 of $(curdir)!"
}

echo "  -> npm publishing/versioning/deployment scripts loaded!"
