#!/usr/bin/env sh
xcode-select --install
sudo chown -R $USER /usr/local

# nvm: node version manager
git clone git://github.com/creationix/nvm.git ~/.nvm
printf "\n\n# NVM\nif [ -s ~/.nvm/nvm.sh ]; then\n\tNVM_DIR=~/.nvm\n\tsource ~/.nvm/nvm.sh\nfi" >> ~/.bash_profile
NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
printf "\nsource ~/.nvm/nvm.sh\n\n" >> ~/.bash_profile

# get nodejs & npm
nvm install v4.4.3    # the most recent lts version
nvm alias default node
nvm use node


npm install -g coffee-script
npm install -g eslint
