################################### NPM VERSIONING / PUBLISHING ####################################
# Increase the current node version
function bump_node {
    tir "$HOME/Library/Application Support/Sublime Text 3/Packages/User/SublimeLinter.sublime-settings" --replace "\.nvm\/versions\/node\/v[0-9]\.[0-9]\.[0-9]\/" ".nvm/versions/node/v$1/"
    tir "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings" --replace "\.nvm\/versions\/node\/v[0-9]\.[0-9]\.[0-9]\/" ".nvm/versions/node/v$1/"
}

# Get npm package version from current project
alias npm_get_package_version="echo $(jq '.version' package.json | tr -d '\"v')"

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

# Module lists
alias npm_hasmodule='cat package.json | ack'
alias npm_mymodules='cat package.json | ack --no-color "\"((mad-logs)|(mad-utils)|(@ottawamhealth\/canimmunize-kavalinscript)|(env-var-helpers)|(common-constants))\"":'
alias mymoduleversions='npm_mymodules'
alias npm_mymodulesall='cat package.json | ack --no-color "\"((mad-logs)|(mad-utils)|(@ottawamhealth\/[a-zA-Z-_$]+)|(kidnap-console)|(env-var-helpers)|(errorcatcher)|(common-constants))\"":'

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
#
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
