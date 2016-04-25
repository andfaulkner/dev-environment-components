#!/usr/bin/env sh
SNIPPETS_FULL=$(echo $(echo ~)/$(echo $SNIPPETS_DIR | sed 's@^~@@') | sed 's@\/\/@\/@')

ln -s $SNIPPETS_DIR/dev-env/vim_configs/vim ~/vim
ln -s $SNIPPETS_DIR/dev-env/vim_configs/.vim ~/.vim
ln -s $SNIPPETS_DIR/dev-env/vim_configs/.vimrc ~/.vimrc
ln -s $SNIPPETS_DIR/dev-env/.pryrc ~/.pryrc
# cd $(echo ~)/$(echo $SNIPPETS_DIR | sed 's@^~@@')
