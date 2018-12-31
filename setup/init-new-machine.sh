echo "Installing script to merge bash history between terminal windows..."

wget -O ~/merge_history.bash http://raw.github.com/pts/pts-merge-history-bash/master/merge_history.bash
touch ~/.merged_bash_history
echo "Successfully installed script for merging bash history between terminal windows!"

################## INSTALLATIONS ##################
# If Mac
if [ "$(uname)" == "Darwin" ]; then
    echo "Mac detected"

# If Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Linux detected"
    # Install Ruby
    sudo apt-get install ruby-full
    # Exit if Ruby install failed
    [ ! $(which ruby) ] && echo "Ruby installation failed - exiting init script" && exit 1
fi


#----- Install Homebrew -----#
# Install homebrew if not present already
[ ! $(which brew) ] && \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || \
    echo "Brew already installed - continuing..."

# Exit init script if Homebrew install failed
[ ! $(which brew) ] && echo "Brew installation failed - exiting init script" && exit 1

# Perform a post-install cleanup
brew cleanup

#----- Install neovim / nvim -----#
brew install neovim

#----- Install CLI utils -----#
brew install ack
brew install tree
brew install gettext
brew install moreutils   # Adds sponge, etc - see https://rentes.github.io/unix/utilities/2015/07/27/moreutils-package
brew install readline
brew install watchman

#----- Install web utils -----#
brew install googler # Search google from the CLI
brew install curl
brew install wget

#----- Install source control systems -----#
brew install git
brew install hub # Github extensions to git
brew install subversion
brew install maven

# Install package to generate TOC for git README
mkdir ~/bin 2>/dev/null
pushd ~/bin
wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc
chmod a+x gh-md-toc
popd

#----- Install languages -----#
brew install gradle
brew install python
brew install python3 # Also installs pip
brew install groovy
brew install erlang
brew install elixir
brew install kotlin
brew install sass/sass/sass
brew install crystal
brew install crystal-lang

#----- Install misc programming utils -----#
brew install jq
brew install llvm@4
brew install docker

#----- Install package managers -----#
brew install leiningen

#----- Install PHP tooling -----#
brew install composer
touch ~/.composer
touch ~/.composer/vendor
touch ~/.composer/vendor/bin

# Make composer work for PHP 7.3 by shutting PHP JIT off
replace ";pcre.jit=1" "pcre.jit=0" -- /usr/local/etc/php/7.3/php.ini 2>/dev/null
brew install phplint

composer global require "squizlabs/php_codesniffer=*"
composer global require "phpmd/phpmd=*"

#----- Install DBs (databases) -----#
### postgres + helpers ###
brew install postgresql
brew install pgbadger
brew install redis
brew install sqlite
brew install mongodb

#----- Install completion utils -----#
brew install pip-completion
brew install gem-completion
brew install bash-completion

#----- Python setup installations  -----#
pip3 install --upgrade pip
pip install --upgrade setuptools
pip3 install --upgrade neovim # Get Neovim working with Python

#----- Go installation & setup -----#
echo "--- SETTING UP GO (golang) ---"
brew install go
if grep -Fq 'export GOPATH=$HOME/projects/go' ~/.bash_profile; then
    echo "go config already present, not adding again"
else
    mkdir ~/projects 2>/dev/null
    mkdir $HOME/projects/go 2>/dev/null
    export GOPATH=$HOME/projects/go
    echo ""
    echo '#----- Go config -----#' >> $HOME/.bash_profile
    echo 'export GOPATH=$HOME/projects/go' >> $HOME/.bash_profile
    echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.bash_profile
    echo "go config added! (including write to to .bash_profile)"
fi

#################### VERSION MANAGERS & PLATFORMS ####################
#----- Install rbenv (ruby version manager) -----#
brew install rbenv

#----- Install nvm -----#
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

#----- Install NodeJS - latest LTS version & set it as default version -----#
brew uninstall --ignore-dependencies node icu4c
brew install node
nvm install --lts
nvm ls | ack '\s+v' | tail -n1 | awk '{print $2}'


########################## GLOBAL NPM MODULES ##########################
npm install -g npm-upgrade
npm install -g ts-node
npm install -g typescript
npm install -g yarn
npm install -g nodemon
npm install -g prettier

########################## SETTINGS ##########################
#----- Enable scrolling in less -----#
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true


########################## COPY SUBLIME PREFERENCES ##########################
echo "Copying sublime preferences files. Warning: return and edit them to reflect machine-specific info"
if [ ! -e "$SUBLIME_DIR/Packages/User/JsPrettier.sublime-settings" ]; then
    echo "Adding Sublime plugin 'JSPrettier' settings"
    cp "$SNIPPETS_DIR/setup/sublime-settings/JSPrettier.sublime-settings" "$SUBLIME_DIR/Packages/User/JsPrettier.sublime-settings"
else
    echo "Not adding Sublime plugin 'JSPrettier' settings - already present"
fi

if [ ! -e $SUBLIME_DIR/Packages/User/import_helper.sublime-settings ]; then
    echo "Adding Sublime plugin 'import_helper' settings"
    cp "$SNIPPETS_DIR/setup/sublime-settings/import_helper.sublime-settings" "$SUBLIME_DIR/Packages/User/import_helper.sublime-settings"
else
    echo "Not adding Sublime plugin 'import_helper' settings - already present"
fi


########################## AUTOCOMPLETIONS ##########################
#----- Add npm completions -----#
echo "--- ADDING npm COMPLETIONS TO .bash_profile ---"

# Create npm completions dir & add npm completion script to it
if [ ! -e ~/.config/npm/npm-completion.sh ]; then
    echo "Making npm completions dir, downloading npm-completion.sh script"
    mkdir ~/.config 2>/dev/null
    mkdir ~/.config/npm 2>/dev/null
    # Download npm completion file and store in correct config location
    npm completion > ~/.config/npm/npm-completion.sh
else
    echo "npm completion script already present, not downloading again"
fi

# Only add npm completions if they're not already added
if grep -Fq "source ~/.config/npm/npm-completion.sh" ~/.bash_profile; then
    echo "npm-completion already added to bash_profile, not adding again"
else
    echo "" >> ~/.bash_profile
    echo "#----- Add npm completions -----#" >> ~/.bash_profile
    echo "source ~/.config/npm/npm-completion.sh" >> ~/.bash_profile
    echo "" >> ~/.bash_profile
    echo "Added npm completion setup to bash_profile"
fi


########################## NVIM SETUP ##########################
echo "--- ADDING SHARED NEOVIM CONFIG ---"

# Symlink neovim config location to neovim config file in current project
# Allows synchronization of nvim config across projects
if [ ! -e ~/.config/nvim/init.vim ]; then
    echo "init.vim exists, not symlinking"
    echo 'To do so anyway, run:'
    echo '    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim_BK'
    echo '    ln -s "$SNIPPETS_DIR/setup/config/init.vim" ~/.config/nvim/init.vim'
else
    mkdir ~/.config 2>/dev/null
    mkdir ~/.config/nvim 2>/dev/null
    ln -s "$SNIPPETS_DIR/setup/config/init.vim" "~/.config/nvim/init.vim"
    echo "neovim config added!"
fi

############## XCode installation ##############
if [ "$(uname -s)" = "Darwin" ]; then
    xcode-select --install
fi


##################### DISPLAY NEW MACHINE INFO #####################
cat $SNIPPETS_DIR/setup/new-machine-info.md
