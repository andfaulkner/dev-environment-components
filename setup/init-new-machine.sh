############# INSTALLATIONS #############
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install neovim / nvim
brew install neovim

# Install CLI utils
brew install ack
brew install jq
brew install tree
brew install readline
brew install wget
brew install watchman
brew install openssl

# Install source control systems
brew install git
brew install subversion
brew install maven

# Install languages
brew install gradle
brew install python
brew install python3 # Also installs pip
brew install groovy
brew install elixir
brew install kotlin

# Install package managers
brew install leiningen
brew install yarn

# Install DBs (databases)
brew install postgresql
brew install redis
brew install sqlite
brew install mongodb

# Install completions
brew install pip-completion
brew install gem-completion
brew install bash-completion

# Python setup installations 
pip3 install --upgrade pip
pip install --upgrade setuptools
pip3 install --upgrade neovim # Get Neovim working with Python

##################### VERSION MANAGERS #####################
# Install rbenv (ruby version manager)
brew install rbenv

# Install nvm 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Install NodeJS - latest LTS version & set it as default version
nvm install --lts
nvm ls | ack '\s+v' | tail -n1 | awk '{print $2}'

############# SETTINGS #############
# Enable scrolling in less
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true


