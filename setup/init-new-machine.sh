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
mkdir ~/bin
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
brew add yarn

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

#----- Go setup installations -----#
brew add go
mkdir ~/projects
mkdir $HOME/projects/go
export GOPATH=$HOME/projects/go
echo 'export GOPATH=$HOME/projects/go' >> $HOME/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.bash_profile


########################## VERSION MANAGERS ##########################
#----- Install rbenv (ruby version manager) -----#
brew add rbenv

#----- Install nvm -----#
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

#----- Install NodeJS - latest LTS version & set it as default version -----#
nvm install --lts
nvm ls | ack '\s+v' | tail -n1 | awk '{print $2}'


########################## SETTINGS ##########################
#----- Enable scrolling in less -----#
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true


########################## AUTOCOMPLETIONS ##########################
#----- Add npm completions -----#
mkdir ~/.config
mkdir ~/.config/npm
npm completion > ~/.config/npm/npm-completion.sh

echo "
source ~/.config/npm/npm-completion.sh
" >> ~/.bash_profile

