#!/usr/bin/env sh
#SNIPPETS_FULL=$(echo $(echo ~)/$(echo $SNIPPETS_DIR | sed 's@^~@@') | sed 's@\/\/@\/@')
SNIPPETS_FULL=$(echo /$(echo $SNIPPETS_DIR | sed 's@^~@@') | sed 's@\/\/@\/@')

ln -s "$SNIPPETS_DIR/dev-env/vim_configs/vim" ~/vim
ln -s "$SNIPPETS_DIR/dev-env/vim_configs/.vim" ~/.vim
ln -s "$SNIPPETS_DIR/dev-env/vim_configs/.vimrc" ~/.vimrc
#ln -s $SNIPPETS_DIR/dev-env/.pryrc ~/.pryrc
# cd $(echo ~)/$(echo $SNIPPETS_DIR | sed 's@^~@@')

# INSTALL VUNDLE
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim ~/.vimrc

# INSTALL NEOBUNDLE
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

# INSTALL VIM-RAILS
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git

# MAKE VIM STORAGE DIRECTORIES
mkdir ~/.vim/backup_files
mkdir ~/.vim/swap_files
mkdir ~/.vim/undo_files

