# Install scripts to synchronize bash history between terminal windows
echo "Installing script to merge bash history between terminal windows..."
wget -O ~/merge_history.bash http://raw.github.com/pts/pts-merge-history-bash/master/merge_history.bash
touch ~/.merged_bash_history
echo "Successfully installed script for merging bash history between terminal windows!"

################## INSTALLATIONS ##################
#----- Install Homebrew -----#
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#----- Install neovim / nvim -----#
brew add neovim

#----- Install CLI utils -----#
brew add ack
brew add tree
brew add gettext
brew add moreutils   # Adds sponge, etc - see https://rentes.github.io/unix/utilities/2015/07/27/moreutils-package
brew add readline
brew add watchman

#----- Install web utils -----#
brew install googler # Search google from the CLI
brew add curl
brew add wget

#----- Install source control systems -----#
brew add git
brew add hub # Github extensions to git
brew add subversion
brew add maven

# Generate TOC for git README
mkdir ~/bin 2>/dev/null
pushd ~/bin
wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc
chmod a+x gh-md-toc
popd

#----- Install languages -----#
brew add gradle
brew add python
brew add python3 # Also installs pip
brew add groovy
brew add elixir
brew add kotlin
brew install sass/sass/sass

#----- Install misc programming utils -----#
brew add jq
brew add llvm@4

#----- Install package managers -----#
brew add leiningen

#### Install DBs (databases) ####
### postgres + helpers ###
brew add postgresql
brew add pgbadger
brew add redis
brew add sqlite
brew add mongodb

#----- Install completion utils -----#
brew add pip-completion
brew add gem-completion
brew add bash-completion

#----- Python setup installations  -----#
pip3 install --upgrade pip
pip install --upgrade setuptools
pip3 install --upgrade neovim # Get Neovim working with Python

#----- Go installation & setup -----#
echo "--- SETTING UP GO (golang) ---"
brew add go
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

########################## VERSION MANAGERS ##########################
#----- Install rbenv (ruby version manager) -----#
brew add rbenv

#----- Install nvm -----#
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

#----- Install NodeJS - latest LTS version & set it as default version -----#
nvm install --lts
nvm ls | ack '\s+v' | tail -n1 | awk '{print $2}'


########################## GLOBAL NPM MODULES ##########################
npm install -g npm-upgrade
npm install -g ts-node
npm install -g typescript
npm install -g yarn

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


