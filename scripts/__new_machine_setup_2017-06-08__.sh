# Install scripts to synchronize bash history between terminal windows
wget -O ~/merge_history.bash http://raw.github.com/pts/pts-merge-history-bash/master/merge_history.bash
touch ~/.merged_bash_history

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install system-wide packages using Homebrew
brew install ack
brew install wget
brew install jq

brew install yarn
brew install tree 
brew install nvim

echo 'source ~/.nvimrc' > ~/.config/nvim/init.vim

